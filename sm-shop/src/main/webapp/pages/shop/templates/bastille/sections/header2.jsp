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
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="/WEB-INF/shopizer-tags.tld" prefix="sm" %>
<%@ taglib uri="/WEB-INF/shopizer-functions.tld" prefix="display" %> 
 
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<script src="<c:url value="/resources/js/hogan.js" />"></script>
<script src="<c:url value="/resources/templates/generic/js/bloodhound.min.js" />"></script>
<script src="<c:url value="/resources/templates/generic/js/typeahead.bundle.min.js" />"></script>


<!-- Customer account menu logged in customer will display in customerAccount placeholder -->
<script type="text/html" id="customerLoggedInAccountTemplate">
			<ul>
				<li class="click_menu"><a href="#"><s:message code="label.generic.welcome" text="Welcome" /> <span>{{firstName}}</span><i class="fa fa-angle-down"></i></a>
					<ul class="click_menu_show">
						<li><a href="#" onClick="javascript:location.href='<c:url value="/shop/customer/dashboard.html" />';" href="#"><s:message code="label.customer.myaccount" text="My account"/></a></li>
						<li><a href="#" onClick="javascript:location.href='<c:url value="/shop/customer/logout" />';" href="#"><s:message code="button.label.logout" text="Logout"/></a></li>
					</ul>
				</li>
			</ul>
			<script type="text/javascript">
                (function($) {
    			$(".click_menu").on('click', function() {
        			$(".click_menu_show").slideToggle(400)
    			});
                })(jQuery);
</script>

<!-- Customer account menu not logged in customer will display in customerAccount placeholder -->
<script type="text/html" id="customerNotLoggedInAccountTemplate">
			<ul>
				<li class="click_menu"><a href="#"><s:message code="label.customer.myaccount" text="My Account"/><i class="fa fa-angle-down"></i></a>
					<ul class="click_menu_show">
						<li><a href="#" id="registerLink" onClick="javascript:location.href='<c:url value="/shop/customer/registration.html" />';"><s:message code="label.generic.register" text="Register" /></a></li>
						<li><a href="#" id="registerLink" onClick="javascript:location.href='<c:url value="/shop/customer/customLogon.html" />';"><s:message code="button.label.signin" text="Signin" /></a></li>
					</ul>
				</li>
			</ul>
			<script type="text/javascript">
                (function($) {
    			$(".click_menu").on('click', function() {
        			$(".click_menu_show").slideToggle(400)
    			});
                })(jQuery);
</script>

<!-- Mini shopping cart JS template -->
<script type="text/html" id="miniCartTemplate">
                          {{#code}}
                          {{#shoppingCartItems}}
                          <li>
									<div class="cart-img">
											{{#image}}
												<img src="<c:out value="${pageContext.servletContext.contextPath}" />{{image}}">
											{{/image}}
											{{^image}}
												&nbsp
											{{/image}}
									</div>	
									<div class="cart-content">
											<h4><a href="#">{{quantity}} x {{name}}</a></h4>
											<span class="cart-price">{{price}}</span>
									</div>
									<div class="cart-del">
											<button productid="{{productId}}" class="close removeProductIcon" onclick="removeItemFromMinicart('{{id}}')"><i class="fa fa-times-circle"></i></a>
									</div>			
							</li>
                            {{/shoppingCartItems}}
                            <li>&nbsp;</li>
							<li class="total-price"><s:message code="label.order.total" text="Total" />&nbsp;{{total}}</li>
							<li class="checkout-bg">
									<a href="#" onclick="viewShoppingCartPage();"><s:message code="label.checkout" text="Checkout"/><i class="fa fa-angle-right"></i></a>
							</li>
                            {{/code}}
							{{^code}}
							<h4 style="text-align: center;color:#666666;margin-top:10px;margin-bottom:10px;"><s:message code="label.emptycart" text="Your Shopping cart is empty" /></h4>
						    {{/code}}

</script>

<!-- mini cart label button template -->
<script type="text/html" id="miniCartSummaryTemplate">
		<!-- empty cart and full summary subTotal & quantity -->
		{{^code}}
		<a href="#"><span class="lnr lnr-cart"></span><s:message code="label.cart" text="Shopping cart"/> (0)</a>
		{{/code}}
		{{#code}}
		<a href="#"><span class="lnr lnr-cart"></span><s:message code="label.cart" text="Shopping cart"/> <font color="red"><strong>({{quantity}})</strong></font></a>
		{{/code}}
</script>


<!-- header-start -->
		<header id="main-header" class="main-header fixed active page">

			<div class="bar header-bottom-area ptb-10">
				<div class="container group">
					<div class="box row">
								<c:choose>
									<c:when test="${requestScope.CONTENT['logo']!=null}">
										<!-- A content logo exist -->
										<sm:pageContent contentCode="logo"/>
									</c:when>
									<c:otherwise>
										<c:choose>
						                		<c:when test="${not empty requestScope.MERCHANT_STORE.storeLogo}">
						                			<!--  use merchant store logo -->
						                			<a class="grey store-name" href="<c:url value="/shop/"/>">
						                			<img class="logoImage" src="<sm:storeLogo/>"/>
						                			</a>
						                		</c:when>
						                		<c:otherwise>
						                			<!-- Use store name -->
						                			<h1>
						                			<a class="grey store-name" href="<c:url value="/shop/"/>">
						                				<c:out value="${requestScope.MERCHANT_STORE.storename}"/>
						                			</a>  
						                			</h1>
						                		</c:otherwise>
						                </c:choose>
									</c:otherwise>
								</c:choose>
					</div>
				</div>
			</div>
			<div class="bar header-bottom-area ptb-10">
				<div class="container group">
					<div class="box row">
						    <!-- Shopping cart -->
						    <c:if test="${requestScope.CONFIGS['allowPurchaseItems'] == true}">						    						
								<div class="header-bottom-right">
									<div class="shop-cart" id="miniCartSummary"></div>
									<div class="shop-cart-hover fix">
										<ul id="miniCartDetails"></ul>
									</div>
								</div>
							</c:if>
					</div>
				</div>
			</div>	
		</header>
		<!-- header-end -->