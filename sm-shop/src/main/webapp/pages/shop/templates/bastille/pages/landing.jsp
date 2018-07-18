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
						<a href="<c:url value="/shop/store/contactus.html"/>"><s:message code="label.customer.contactus" text="Contact us"/></a>						
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
			
			
		<!-- featured items -->
		<!-- Using ajax -->
		
		
		<!-- service-area-end -->
		<!--new-product-area-start -->
<%-- 		<c:if test="${requestScope.FEATURED_ITEM!=null}"> --%>
<!-- 		<div class="new-product-area pt-80 pb-20"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12"> -->
<!-- 						<div class="section-title text-center"> -->
<%-- 							<h2><s:message code="menu.catalogue-featured" text="Featured items" /></h2> --%>
<%-- 						    <c:if test="${requestScope.CONTENT['featuredItemsText']!=null}"> --%>
<%-- 			    				<sm:pageContent contentCode="featuredItemsText"/> --%>
<%-- 		        			</c:if> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 		</c:if> --%>
		
		
		<!-- featured items -->
		<section class="products-grid">
			<div class="container">
				<h2>Best Seller</h2>
			</div>
			<div class="container">
				<div id="featuredItemsContainer" class="row products-container"></div>
			</div>
		</section>
		
	<!-- load products -->	
	<script>
	       $(document).ready(function() {
	    	   
	    	   $('#featuredItemsContainer').LoadingOverlay("show");
	    	   
				var tpl = $('#productBoxTemplate').text();
			    tpl = tpl.replace("COLUMN-SIZE", "3");
			    $('#productBoxTemplate').text(tpl);

				//get products
				loadFeaturedItems();

          })
		  
		  
		  
		  function loadFeaturedItems() {
		  	$.ajax({
				type: 'GET',
				dataType: "json",
				url: '<c:url value="/"/>services/public/<c:out value="${requestScope.MERCHANT_STORE.code}"/>/products/group/FEATURED_ITEM',
				success: function(productList) {

					//set in slider
					var productsTemplate = Hogan.compile(document.getElementById("productBoxTemplate").innerHTML);
					var productsRendred = productsTemplate.render(productList);
					$('#featuredItemsContainer').append(productsRendred);
					$('#featuredItemsContainer').LoadingOverlay("hide", true);
					//call init bindings
					initBindings();
					setProductRating(productList.products);
				},
				error: function(jqXHR,textStatus,errorThrown) { 
					$(divProductsContainer).hideLoading();
					alert('Error ' + jqXHR + "-" + textStatus + "-" + errorThrown);
				}
			});
		  }
	       
	        
	       
          </script>
		  <!--- END -->


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


<!--End mc_embed_signup-->
			
		