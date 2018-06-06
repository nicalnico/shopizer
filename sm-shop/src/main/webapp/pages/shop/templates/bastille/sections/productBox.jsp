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

	
	<!-- include all header js and css -->
	<jsp:include page="/pages/shop/templates/bastille/sections/jsLinks.jsp" />
    <jsp:include page="/pages/shop/templates/bastille/sections/shopLinks.jsp" />
                
<div id="productsContainer" class="list-unstyled"> 
										<c:forEach items="${requestScope.ITEMS}" var="product">
											<div class="col-sm-4 col-sm-6 col-xs-12 product" data-id="${product.id}" item-price="${product.price}" item-name="${product.description.name}" item-order="${product.sortOrder}">
<!-- 											<div class="box-style-1 white-bg object-non-visible animated object-visible"> -->												
												<div class="box-style-4 white-bg object-non-visible animated object-visible">											
												
												    <c:if test="${product.description.highlights!=null && product.description.highlights!=''}">
												    <div class="ribbon-wrapper-green">
												    	<div class="ribbon-green">
												    		<c:out value="${product.description.highlights}" />
												    	</div>
											    	    </div>
												    </c:if> 
												    <c:if test="${!product.canBePurchased }">
													    <div class="sold-out-box">
	    															<span class="sold-out-text"><s:message code="label.soldout" text="Sold out" /></span>
	  													</div> 
												    </c:if>                                    
													<div class="product-image"><c:if test="${product.image!=null}"><a href="<c:url value="/shop/product/" /><c:out value="${product.description.friendlyUrl}"/>.html"><img src="<sm:shopProductImage imageName="${product.image.imageName}"  sku="${product.sku}"/>" class="product-img" /></a></c:if></div>												
													
													<!--  *** Product Name & Price Starts4 *** -->
													<div class="caption">
														<div class="product-details">	
															<a class="listing-product-name" href=href="<c:url value="/shop/product/" /><c:out value="${product.description.friendlyUrl}"/>.html<sm:breadcrumbParam productId="${product.id}"/>"><h3 itemprop="name">${product.description.name}</h3>
															</a>
															<h4>
																<c:choose>
																	<c:when test="${product.discounted}">
																		<del><c:out value="${product.originalPrice}" /></del>&nbsp;<span class="specialPrice" itemprop="price"><c:out value="${product.finalPrice}" /></span>
																	</c:when>
																	<c:otherwise>
																		<span itemprop="price"><c:out value="${product.finalPrice}" /></span>
																	</c:otherwise>
																</c:choose>
															</h4>
															<!-- Product Name & Price Ends -->
															<!-- Product Buttons Starts -->
															<div class="clearfix">
																<a class="btn btn-detail pull-left" href="<c:url value="/shop/product/" /><c:out value="${product.description.friendlyUrl}"/>.html<sm:breadcrumbParam productId="${product.id}"/>"><s:message code="button.label.view" text="Details" /></a>
																	<c:choose>
																		<c:when test="${requestScope.FEATURED==true}">
																			<c:if test="${requestScope.CONFIGS['displayAddToCartOnFeaturedItems']==true && requestScope.CONFIGS['allowPurchaseItems']==true && product.canBePurchased}"><a class="btn btn-buy pull-right addToCart" href="javascript:void(0);" productId="${product.id}"><s:message code="button.label.addToCart" text="Add to cart" /></a>
																			</c:if>
																		</c:when>
																		<c:otherwise>
																			<c:if test="${requestScope.CONFIGS['allowPurchaseItems']==true  && product.canBePurchased}">
																		 		<a class="btn btn-buy pull-right addToCart" href="javascript:void(0);" productId="${product.id}"><s:message code="button.label.addToCart" text="Add to cart" /></a>
																			</c:if>
																		</c:otherwise>
																	</c:choose>
															</div>
														</div>
														<!-- Product Buttons Ends -->
													</div>
												</div>
											</div>
										</c:forEach>
</div>

<%-- 										<c:forEach items="${requestScope.ITEMS}" var="product"> --%>
<!-- 										<div class="single-new-product single-new-product-override"> -->
<!-- 												<div class="product-img"> -->
<%-- 													<c:if test="${product.image!=null}"><a href="<c:url value="/shop/product/" /><c:out value="${product.description.friendlyUrl}"/>.html"><img src="<sm:shopProductImage imageName="${product.image.imageName}" sku="${product.sku}"/>" class="first_img"/></a></c:if> --%>
<!-- 												</div> -->
<!-- 												<div class="product-content text-center"> -->
<%-- 													<h3>${product.description.name}</h3> --%>
<%-- 													<h4><c:choose> --%>
<%-- 															<c:when test="${product.discounted}"> --%>
<%-- 																<del><c:out value="${product.originalPrice}" /></del>&nbsp;<span class="specialPrice"><c:out value="${product.finalPrice}" /></span> --%>
<%-- 															</c:when> --%>
<%-- 															<c:otherwise> --%>
<%-- 																<c:out value="${product.finalPrice}" /> --%>
<%-- 															</c:otherwise> --%>
<%-- 														</c:choose> --%>
<!-- 													</h4> -->
<!-- 													<br> -->
<!-- 													<h5> -->
<%-- 														<a href="<c:url value="/shop/product/" /><c:out value="${product.description.friendlyUrl}"/>.html<sm:breadcrumbParam productId="${product.id}"/>"><s:message code="button.label.view" text="Details" /></a> <c:choose><c:when test="${requestScope.FEATURED==true}"><c:if test="${requestScope.CONFIGS['displayAddToCartOnFeaturedItems']==true}">/ <a class="addToCart" href="#" productId="${product.id}"><s:message code="button.label.addToCart" text="Add to cart" /></a></c:if></c:when><c:otherwise>/ <a class="addToCart" href="#" productId="${product.id}"><s:message code="button.label.addToCart" text="Add to cart" /></a></c:otherwise></c:choose> --%>
<!-- 													</h5> -->
<!-- 												</div> -->
<!-- 										</div> -->
<%-- 										</c:forEach>    --%>