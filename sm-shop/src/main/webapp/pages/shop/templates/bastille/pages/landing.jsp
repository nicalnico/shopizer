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
	    	
	<div id="shop" class="">
	 
	       <div style="margin-top: 5px; max-width:100%" class="banner">
			
	  			<style>
				 	.banner img {
				 		max-width:100% !important; 
				 	}
				</style>
			    
	    	<script src="<c:url value="/resources/js/jquery-1.11.3.min.js" />"></script>
		    <script	src="<c:url value="/resources/js/jssor.slider-27.1.0.min.js" />"></script>
			              
				       <script type="text/javascript">
			        		jQuery(document).ready(function ($) {
			
			            var jssor_1_SlideshowTransitions = [
			              {$Duration:600,$Delay:20,$Cols:8,$Rows:4,$Formation:$JssorSlideshowFormations$.$FormationStraightStairs,$Assembly:2050,$Opacity:2}
			            ];
			
			            var jssor_1_SlideoTransitions = [
			              [{b:0,d:2000,x:518,y:45}],
			              [{b:0,d:2000,x:1,y:364}],
			              [{b:0,d:2000,x:673,y:2}],
			              [{b:0,d:2000,x:-6,y:402}]
			            ];
			
			            var jssor_1_options = {
			              $AutoPlay: 1,
			              $SlideDuration: 180,
			              $LazyLoading: 0,
			              $SlideshowOptions: {
			                $Class: $JssorSlideshowRunner$,
			                $Transitions: jssor_1_SlideshowTransitions
			              },
			              $CaptionSliderOptions: {
			                $Class: $JssorCaptionSlideo$,
			                $Transitions: jssor_1_SlideoTransitions
			              },
			              $ArrowNavigatorOptions: {
			                $Class: $JssorArrowNavigator$
			              },
			              $BulletNavigatorOptions: {
			                $Class: $JssorBulletNavigator$
			              }
			            };
			
			            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
			
			            /*#region responsive code begin*/
			
			            var MAX_WIDTH = 4000;
			
			            function ScaleSlider() {
			                var containerElement = jssor_1_slider.$Elmt.parentNode;
			                var containerWidth = containerElement.clientWidth;
			
			                if (containerWidth) {
			
			                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);
			
			                    jssor_1_slider.$ScaleWidth(expectedWidth);
			                }
			                else {
			                    window.setTimeout(ScaleSlider, 30);
			                }
			            }
			
			            ScaleSlider();
			
			            $(window).bind("load", ScaleSlider);
			            $(window).bind("resize", ScaleSlider);
			            $(window).bind("orientationchange", ScaleSlider);
			            /*#endregion responsive code end*/
			        });
			    </script>
			    <style>
			    	.banner img {
			    		max-width:100% !important; 
			    	}
			    
			        /*jssor slider loading skin spin css*/
			        .jssorl-009-spin img {
			            animation-name: jssorl-009-spin;
			            animation-duration: 1.6s;
			            animation-iteration-count: infinite;
			            animation-timing-function: linear;
			        }
			
			        @keyframes jssorl-009-spin {
			            from { transform: rotate(0deg); }
			            to { transform: rotate(360deg); }
			        }
			
			        /*jssor slider bullet skin 032 css*/
			        .jssorb032 {position:absolute;}
			        .jssorb032 .i {position:absolute;cursor:pointer;}
			        .jssorb032 .i .b {fill:#fff;fill-opacity:0.7;stroke:#000;stroke-width:1200;stroke-miterlimit:10;stroke-opacity:0.25;}
			        .jssorb032 .i:hover .b {fill:#000;fill-opacity:.6;stroke:#fff;stroke-opacity:.35;}
			        .jssorb032 .iav .b {fill:#000;fill-opacity:1;stroke:#fff;stroke-opacity:.35;}
			        .jssorb032 .i.idn {opacity:.3;}
			
			        /*jssor slider arrow skin 051 css*/
			        .jssora051 {display:block;position:absolute;cursor:pointer;}
			        .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
			        .jssora051:hover {opacity:.8;}
			        .jssora051.jssora051dn {opacity:.5;}
			        .jssora051.jssora051ds {opacity:.3;pointer-events:none;}
			    </style>
			    <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:1300px;height:500px;overflow:hidden;visibility:hidden;">
			        <!-- Loading Screen -->
			        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
			            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="/resources/img/banner/bastille/spin.svg" />
			        </div>
			        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:1300px;height:500px;overflow:hidden;">
			            <div data-p="225.00">
            	   	    	<a href="https://labastille.com.au/shop/category/duck-products.html/ref=c:150" data-p="170.00">
			                	<img data-u="image" src="/resources/img/banner/bastille/slide_8.jpg" />
			                	<div data-u="caption" data-t="0" style="position:absolute;top:31px;left:-36px;width:844px;height:75px;font-size:60px;color:#fc020e;line-height:1.2;text-align:center;">LaBastille is a taste of France<br />
			                	</div>
			            	</a>			               
			            </div>
			            <div data-p="225.00">
			                <a href="https://labastille.com.au/shop/category/duck-products.html/ref=c:150" data-p="170.00">
				                <img data-u="image" src="/resources/img/banner/bastille/slide_5.jpg" />
				                <div data-u="caption" data-t="1" style="position:absolute;top:0px;left:0px;width:532px;height:74px;font-size:60px;color:#fc000c;line-height:1.2;text-align:center;">Try our delicious Foie Gras<br />
				                </div>
				            </a>
			            </div>
			            <div data-p="225.00">
			                <a href="https://labastille.com.au/shop/category/duck-products.html/ref=c:150" data-p="170.00">
				                <img data-u="image" src="/resources/img/banner/bastille/slide_4.jpg" />
				                <div data-u="caption" data-t="2" style="position:absolute;top:53px;left:-8px;width:649px;height:72px;font-size:60px;color:#f80006;line-height:1.2;text-align:center;">Wonderful Duck confit<br />
				                </div>
				            </a>
			            </div>
			            <div data-p="225.00">
			                <a href="https://labastille.com.au/shop/category/duck-products.html/ref=c:150" data-p="170.00">
				                <img data-u="image" src="/resources/img/banner/bastille/alexis-minchella-web.jpg" />
				                <div data-u="caption" data-t="3" style="position:absolute;top:21px;left:-101px;width:649px;height:72px;font-size:60px;color:#fb0202;line-height:1.2;text-align:center;">Feel French<br />
				                </div>
				            </a>
			            </div>
			        </div>
			        <!-- Bullet Navigator -->
			        <div data-u="navigator" class="jssorb032" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
			            <div data-u="prototype" class="i" style="width:16px;height:16px;">
			                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
			                    <circle class="b" cx="8000" cy="8000" r="5800"></circle>
			                </svg>
			            </div>
			        </div>
			        <!-- Arrow Navigator -->
			        <div data-u="arrowleft" class="jssora051" style="width:65px;height:65px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
			            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
			                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
			            </svg>
			        </div>
			        <div data-u="arrowright" class="jssora051" style="width:65px;height:65px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
			            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
			                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
			            </svg>
			        </div>
			    </div>
			    <!-- #endregion Jssor Slider End -->
	
	       </div>
	
	
	</div>

	<c:if test="${page!=null}">
		<div class="row-fluid">
	   		    <div class="span12">
	   			    <span id="homeText"><c:out value="${page.description}" escapeXml="false"/></span>
	   		    </div>
		</div>
		<br/>
	</c:if>
			

<div class="row text-center" style="margin-top: 5px;" >
	<div class="shop-now">
		<a href="<c:url value="/shop/category/duck-products.html/ref=c:150"/>">
		<s:message code="label.shop.now" text="Shop Now" /></a>
	</div>
</div>


	<div class="row text-center" style="margin-top: 5px;" >
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-process">
					<!-- process Icon -->
					<div class="picon">
						<i class="fa fa-truck"></i>
					</div>
					<!-- process Content -->
					<div class="process_content">
						<h3>Free Shipping over $100</h3>
						<p>In Australia</p>
					</div>
				</div>
			</div>
			<!-- End Col -->
	
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-process">
					<!-- process Icon -->
					<div class="picon">
						<i class="fa fa-money"></i>
					</div>
					<!-- process Content -->
					<div class="process_content">
						<h3>Easy and Simple</h3>
						<p></p>
					</div>
				</div>
			</div>
			<!-- End Col -->
	
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-process">
					<!-- process Icon -->
					<div class="picon">
						<i class="fa fa-headphones "></i>
					</div>
					<!-- process Content -->
					<div class="process_content">
						<h3>Support 24/7</h3>
						<a href="https://ambroselli.art/shop/store/contactus.html"><p>Please contact us</p></a>
					</div>
				</div>
			</div>
			<!-- End Col -->
	
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-process">
					<!-- process Icon -->
					<div class="picon">
						<i class="fa fa-clock-o"></i>
					</div>
					<!-- process Content -->
					<div class="process_content">
						<h3>Quality & Fast delivery</h3>
						<p></p>
					</div>
				</div>
			</div>
			<!-- End Col -->
	</div>
			
			
			
			
			<br/>
			<sm:shopProductGroup groupName="FEATURED_ITEM"/>
			<sm:shopProductGroup groupName="SPECIALS"/>
			
			<c:if test="${requestScope.FEATURED_ITEM!=null || requestScope.SPECIALS!=null}" >
			<div class="row-fluid">
				<div class="span12">
					<ul class="nav nav-tabs home" id="product-tab">
						<c:if test="${requestScope.FEATURED_ITEM!=null}" ><li class="active"><a href="#tab1"><s:message code="menu.catalogue-featured" text="Featured items" /></a></li></c:if>
						<c:if test="${requestScope.SPECIALS!=null}" ><li<c:if test="${requestScope.FEATURED_ITEM==null}"> class="active"</c:if>><a href="#tab2"><s:message code="label.product.specials" text="Specials" /></a></li></c:if>
					</ul>							 
					<div class="tab-content">
						<!-- one div by section -->
						<c:if test="${requestScope.FEATURED_ITEM!=null}" >
						
						<div class="tab-pane active" id="tab1">
									<ul class="thumbnails product-list">
									    <!-- Iterate over featuredItems -->
										<c:set var="ITEMS" value="${requestScope.FEATURED_ITEM}" scope="request" />
										<c:set var="FEATURED" value="true" scope="request" />
	                         			<jsp:include page="/pages/shop/templates/exoticamobilia/sections/productBox.jsp" />
									</ul>
									
						</div>
						</c:if>
						<c:if test="${requestScope.SPECIALS!=null}" >
						<div class="tab-pane <c:if test="${requestScope.FEATURED_ITEM==null}">active</c:if>" id="tab2">
									<ul class="thumbnails product-list">
										<!-- Iterate over featuredItems -->
                         				<c:set var="ITEMS" value="${requestScope.SPECIALS}" scope="request" />
	                         			<jsp:include page="/pages/shop/templates/exoticamobilia/sections/productBox.jsp" />
									</ul>
						</div>
						</c:if>

					</div>							
				</div>
			</div>
			</c:if>

			
		