<%
response.setCharacterEncoding("UTF-8");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="/WEB-INF/shopizer-tags.tld" prefix="sm" %> 
 
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%> 

<script type="text/javascript">

$(document).ready(function() {
	
	removeCart();
});

</script>



<c:if test="${requestScope.CONFIGS['google_analytics_url'] != null && confirmation!=null}">


<script type="text/javascript">
//<![CDATA[ 

	
	if(_gaq) {
		
		
	//console.log('GAQ ');

	_gaq.push(['_trackPageview']);
	_gaq.push(['_addTrans', 
		'<c:out value="${order.id}"/>', // order ID - required 
		'<c:out value="${requestScope.MERCHANT_STORE.storename}"/>', //Store Name
	    '<sm:monetary value="${order.total.value}"/>',  // total - required
		'<sm:monetary value="${order.tax.value}"/>',  // tax 
		<c:choose>
		<c:when test="${order.shipping!=null}">
		'<sm:monetary value="${order.shipping.value}"/>', // shipping 
		</c:when>
		<c:otherwise>
		'',
		</c:otherwise>
		</c:choose>
		'<c:out value="${order.customer.billing.city}"/>', // city
		<c:choose>
		<c:when test="${order.customer.billing.zone!=null}">
		'<c:out value="${order.customer.billing.zone}"/>',// state or province 
		</c:when>
		<c:otherwise>
		'<c:out value="${order.customer.billing.zone.stateProvince}"/>',// state or province 
		</c:otherwise>
		</c:choose>
		'<c:out value="${order.customer.billing.country}"/>' // country
		 ]);


	<c:forEach items="${order.products}" var="product" varStatus="status">

	_gaq.push(['_addItem', 
		'<c:out value="${order.id}"/>', // order ID - required 
		'<c:out value="${product.sku}" />', // SKU/code - required 
		'<c:out value="${product.productName}" />', // product name 
		'<c:out value="${product.price}" />', // unit price - required 
		'<c:out value="${product.orderedQuantity}" />' // quantity - required 
		]); 

	</c:forEach>

	_gaq.push(['_trackTrans']); //submits transaction to the Analytics servers 

	}


	//]]> 
</script>


<!-- Google Adwords Event snippet for Sales conversion page Bastille-->
<script>
  gtag('event', 'conversion', {
      'send_to': 'AW-802166772/x0bLCKHK64MBEPSvwP4C',
      'value': '<sm:monetary value="${order.total.value}"/>',
      'currency': 'AUD',
      'transaction_id': '<c:out value="${order.id}"/>'
  });
</script>



<!-- Google Merchants snippet for Customer review page Bastille-->
<script src="https://apis.google.com/js/platform.js?onload=renderOptIn" async defer></script>
<script>


  window.renderOptIn = function() {
    window.gapi.load('surveyoptin', function() {
      window.gapi.surveyoptin.render(
        {
          // REQUIRED FIELDS
          "merchant_id": 123349391,
          "order_id": '<c:out value="${order.id}"/>',
          "email": '<c:out value="${order.customer.emailAddress}" />',
          "delivery_country": "AU",
          "estimated_delivery_date": '<c:out value="${orderdeliveryestimate}" />', 
          "products": '<c:out value="${productsgtin}" escapeXml="false" />'
        });
    });
  }
</script>


<!-- Facebook Pixel Purchase Bastille-->
<script>
  fbq('track', 'Purchase', {
    value: '<sm:monetary value="${order.total.value}"/>'',
    currency: 'AUD',
    content_ids: '<c:out value="${order.id}"/>',
  });
</script>

</c:if>


	<div id="main-content" class="container clearfix no-padding-left">
		<h1><s:message code="label.checkout.confirmation" text="Order completed" /></h1>
		<div class="row-fluid">
			<div class="span12">  


          <p class="lead"><c:out value="${ordermessage}" /></p>
          <p class="lead"><c:out value="${ordermessageid}" /></p>
          <p><c:out value="${orderemail}" /></p>
          

          
          <c:if test="${downloads!=null}">
          	<p>
          	<c:choose>
          		<c:when test="${order.orderStatus.value=='processed'}">
          		    <strong><s:message code="label.checkout.downloads.completed" text="label.checkout.downloads.completed"/></strong><br/>
          			<c:forEach items="${downloads}" var="download">
          				<a href="<sm:orderProductDownload productDownload="${download}" orderId="${order.id}"/>"><c:out value="${download.fileName}" /></a>
          			</c:forEach>
          		</c:when>
          		<c:otherwise>
					<s:message code="label.checkout.downloads.processing" text="*** An email with your file(s) download instructions will be sent once the payment for this order will be completed."/>
          		</c:otherwise>
          	</c:choose>
			</p>
          </c:if>
          
          <p class="muted"><s:message code="label.checkout.additionaltext" text="If you have any comments or suggestions for us, please send us an email with your order id. We value your feedback."/></p>
          
          
            </div>
            
      </div>
          
   </div>
      
<!-- add newsletter -->
<!-- Begin MailChimp Signup Form -->
<div class="row text-center" style="margin-top: 5px;">
	<div class="signup">
		<form action="https://labastille.us18.list-manage.com/subscribe/post?u=0c2a7258b68e61aa3c539ff35&amp;id=70c2c820ab" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
		    <div>
				<p>Get the latest news, exciting offers and discounts to your inbox</p>
				<div class="">			
					<label for="mce-EMAIL"><i class="fa fa-envelope-o"></i></label>
					<input type="email" name="EMAIL" class="required email" id="mce-EMAIL" title="Email Address" class="input-text required-entry validate-email" />				
					<input type="submit" value="SIGN UP" name="subscribe" id="mc-embedded-subscribe" class="button">
				</div>
				<div id="mce-responses" class="clear">
					<div class="response" id="mce-error-response" style="display:none"></div>
					<div class="response" id="mce-success-response" style="display:none"></div>
				</div> 
			 <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
		    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_0c2a7258b68e61aa3c539ff35_70c2c820ab" tabindex="-1" value=""></div>
		    </div>
		</form>
	</div>
</div>