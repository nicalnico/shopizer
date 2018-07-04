package com.salesmanager.shop.store.controller.order;

import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.order.OrderService;
import com.salesmanager.core.business.services.order.orderproduct.OrderProductDownloadService;
import com.salesmanager.core.business.services.payments.PaymentService;
import com.salesmanager.core.business.services.reference.country.CountryService;
import com.salesmanager.core.business.services.reference.zone.ZoneService;
import com.salesmanager.core.business.services.shipping.ShippingService;
import com.salesmanager.core.business.services.shoppingcart.ShoppingCartService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.Order;
import com.salesmanager.core.model.order.orderproduct.OrderProduct;
import com.salesmanager.core.model.order.orderproduct.OrderProductDownload;
import com.salesmanager.core.model.order.orderproduct.OrderProductPrice;
import com.salesmanager.core.model.reference.country.Country;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.reference.zone.Zone;
import com.salesmanager.shop.constants.Constants;
import com.salesmanager.shop.model.catalog.product.ProductPrice;
import com.salesmanager.shop.model.order.ReadableOrder;
import com.salesmanager.shop.model.order.ReadableOrderProductDownload;
import com.salesmanager.shop.populator.order.ReadableOrderProductDownloadPopulator;
import com.salesmanager.shop.store.controller.AbstractController;
import com.salesmanager.shop.store.controller.ControllerConstants;
import com.salesmanager.shop.store.controller.customer.facade.CustomerFacade;
import com.salesmanager.shop.store.controller.order.facade.OrderFacade;
import com.salesmanager.shop.store.controller.shoppingCart.facade.ShoppingCartFacade;
import com.salesmanager.shop.utils.LabelUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping(Constants.SHOP_URI+"/order")
public class ShoppingOrderConfirmationController extends AbstractController {
	
	private static final Logger LOGGER = LoggerFactory
	.getLogger(ShoppingOrderConfirmationController.class);
	
	@Inject
	private ShoppingCartFacade shoppingCartFacade;
	
    @Inject
    private ShoppingCartService shoppingCartService;
	

	
	@Inject
	private PaymentService paymentService;
	
	@Inject
	private ShippingService shippingService;
	

	@Inject
	private OrderService orderService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private CountryService countryService;
	
	@Inject
	private ZoneService zoneService;
	
	@Inject
	private OrderFacade orderFacade;
	
	@Inject
	private LabelUtils messages;
	
	@Inject
	private PricingService pricingService;

    @Inject
    private  CustomerFacade customerFacade;
	
	@Inject
    private AuthenticationManager customerAuthenticationManager;
	
	@Inject
	private OrderProductDownloadService orderProdctDownloadService;

	/**
	 * Invoked once the payment is complete and order is fulfilled
	 * @param model
	 * @param request
	 * @param response
	 * @param locale
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/confirmation.html")
	public String displayConfirmation(Model model, HttpServletRequest request, HttpServletResponse response, Locale locale) throws Exception {

		Language language = (Language)request.getAttribute("LANGUAGE");
		MerchantStore store = (MerchantStore)request.getAttribute(Constants.MERCHANT_STORE);

		Long orderId = super.getSessionAttribute(Constants.ORDER_ID, request);
		if(orderId==null) {
			return new StringBuilder().append("redirect:").append(Constants.SHOP_URI).toString();
		}

		//get the order
		Order order = orderService.getById(orderId);
		if(order == null) {
			LOGGER.warn("Order id [" + orderId + "] does not exist");
			throw new Exception("Order id [" + orderId + "] does not exist");
		}
		
		if(order.getMerchant().getId().intValue()!=store.getId().intValue()) {
			LOGGER.warn("Store id [" + store.getId() + "] differs from order.store.id [" + order.getMerchant().getId() + "]");
			return new StringBuilder().append("redirect:").append(Constants.SHOP_URI).toString();
		}

		if(super.getSessionAttribute(Constants.ORDER_ID_TOKEN, request)!=null) {
			//set this unique token for performing unique operations in the confirmation
			model.addAttribute("confirmation", "confirmation");
		}
		
		//remove unique token
		super.removeAttribute(Constants.ORDER_ID_TOKEN, request);
		
		
        String[] orderMessageParams = {store.getStorename()};
        String orderMessage = messages.getMessage("label.checkout.text", orderMessageParams, locale);
		model.addAttribute("ordermessage", orderMessage);
		
        String[] orderIdParams = {String.valueOf(order.getId())};
        String orderMessageId = messages.getMessage("label.checkout.orderid", orderIdParams, locale);
		model.addAttribute("ordermessageid", orderMessageId);
		
        String[] orderEmailParams = {order.getCustomerEmailAddress()};
        String orderEmailMessage = messages.getMessage("label.checkout.email", orderEmailParams, locale);
		model.addAttribute("orderemail", orderEmailMessage);
		
		//NEW CODE
	    Date orderDeliveryEstimate = new Date();
	    Calendar cal = Calendar.getInstance();  
	    cal.setTime(orderDeliveryEstimate); 
	    cal = addBusinessDate(cal, 5);
	    orderDeliveryEstimate = cal.getTime(); 
		model.addAttribute("orderdeliveryestimate", new SimpleDateFormat("yyyy-MM-dd").format(orderDeliveryEstimate));
		
		String products = "[";
		int numberOfProducts = order.getOrderProducts().size();
		for (OrderProduct orderProduct : order.getOrderProducts()) {
			products += "{\"gtin\":'\"" + ((orderProduct.getRefSku().isEmpty()) ? orderProduct.getSku() : orderProduct.getRefSku()) + "\"}";
			numberOfProducts--;
			if (numberOfProducts > 0) {
				products += ",";
			}			
		}
		products += "]";
		model.addAttribute("products_google_review_format", products);
		
		products = "[";
		numberOfProducts = order.getOrderProducts().size();
		for (OrderProduct orderProduct : order.getOrderProducts()) {
			products += "{";
			products += " id: '" +  orderProduct.getSku() + "' ,";
			products += " quantity: '" +  orderProduct.getProductQuantity()+ "' , ";				
			Set<OrderProductPrice> prices = orderProduct.getPrices();
			BigDecimal defaultPrice = null;
			for(OrderProductPrice price : prices) {	
				if(price.getDefaultPrice()) {
					defaultPrice = price.getProductPrice();
					break;
				}
			}
			if (defaultPrice != null) {
				products += " item_price: '" +  defaultPrice +  "'";	
			} else {
				if (orderProduct.getPrices().isEmpty()) {
					products += " item_price: '0.01'"; 
				} else {
					products += " item_price: '" + ((OrderProductPrice) orderProduct.getPrices().toArray()[0]).getProductPrice() + "' , ";
				}
				
			}
			products += "} ";
			numberOfProducts--;
			if (numberOfProducts > 0) {
				products += ",";
			}			
		}
		products += "]";
		model.addAttribute("products_facebook_pixel_format", products);
		//NEW CODE END
		
		ReadableOrder readableOrder = orderFacade.getReadableOrder(orderId, store, language);
		

		
		//resolve country and Zone for GA
		String countryCode = readableOrder.getCustomer().getBilling().getCountry();
		Map<String,Country> countriesMap = countryService.getCountriesMap(language);
		Country billingCountry = countriesMap.get(countryCode);
		if(billingCountry!=null) {
			readableOrder.getCustomer().getBilling().setCountry(billingCountry.getName());
		}
		
		String zoneCode = readableOrder.getCustomer().getBilling().getZone();
		Map<String,Zone> zonesMap = zoneService.getZones(language);
		Zone billingZone = zonesMap.get(zoneCode);
		if(billingZone!=null) {
			readableOrder.getCustomer().getBilling().setZone(billingZone.getName());
		}
		
		
		model.addAttribute("order",readableOrder);
		
		//check if any downloads exist for this order
		List<OrderProductDownload> orderProductDownloads = orderProdctDownloadService.getByOrderId(order.getId());
		if(CollectionUtils.isNotEmpty(orderProductDownloads)) {
			ReadableOrderProductDownloadPopulator populator = new ReadableOrderProductDownloadPopulator();
			List<ReadableOrderProductDownload> downloads = new ArrayList<ReadableOrderProductDownload>();
			for(OrderProductDownload download : orderProductDownloads) {
				ReadableOrderProductDownload view = new ReadableOrderProductDownload();
				populator.populate(download, view,  store, language);
				downloads.add(view);
			}
			model.addAttribute("downloads", downloads);
		}
		
		
		/** template **/
		StringBuilder template = new StringBuilder().append(ControllerConstants.Tiles.Checkout.confirmation).append(".").append(store.getStoreTemplate());
		return template.toString();

		
	}
	
	
	//NEW CODE
	public Calendar addBusinessDate(Calendar cal, int numBusinessDays) {
		  int numNonBusinessDays = 0;

		  for(int i = 0; i < numBusinessDays; i++) {
		    cal.add(Calendar.DATE, 1);

		    if(cal.get(Calendar.DAY_OF_WEEK) == 1 ||
		       cal.get(Calendar.DAY_OF_WEEK) == 7) {
		      numNonBusinessDays++;
		    }
		  }

		  if(numNonBusinessDays > 0) {
		    cal.add(Calendar.DATE, numNonBusinessDays);
		  }

		  return cal;
		}
	//NEW CODE END
	


}
