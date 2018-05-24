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
	 
	       <div style="margin-top: 5px;" class="banner center-block">
			    
			    <script src="<c:url value="/resources/js/jquery-1.11.3.min.js" />"></script>
			    <script	src="<c:url value="/resources/js/jssor.slider-27.1.0.min.js" />"></script>
			    
<script type="text/javascript">
        jQuery(document).ready(function ($) {

            var jssor_1_SlideshowTransitions = [
              {$Duration:800,$Opacity:2}
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: jssor_1_SlideshowTransitions
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

            var MAX_WIDTH = 980;

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

        /*jssor slider bullet skin 054 css*/
        .jssorb054 .i {position:absolute;cursor:pointer;}
        .jssorb054 .i .b {fill:#000;fill-opacity:0.3;}
        .jssorb054 .i:hover .b {fill-opacity:.7;}
        .jssorb054 .iav .b {fill-opacity: 1;}
        .jssorb054 .i.idn {opacity:.3;}

        /*jssor slider arrow skin 081 css*/
        .jssora081 {display:block;position:absolute;cursor:pointer;}
        .jssora081 .c {fill:#000;fill-opacity:.5;stroke:#fff;stroke-width:120;stroke-miterlimit:10;stroke-opacity:0.5;}
        .jssora081 .a {fill:#fff;opacity:.8;}
        .jssora081:hover .c {fill-opacity:.3;}
        .jssora081:hover .a {opacity:1;}
        .jssora081.jssora081dn {opacity:.5;}
        .jssora081.jssora081ds {opacity:.3;pointer-events:none;}
    </style>
    <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:980px;height:380px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="img/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:980px;height:380px;overflow:hidden;">
		            <div data-fillmode="1" data-p="2720">
		                <img data-u="image" src="/resources/img/banner/bastille/slide_foie_gras_2.jpg" />
		                <div style="position:absolute;top:47px;left:-4px;width:200px;height:40px;font-size:32px;color:#000000;line-height:1.2;text-align:center;">Delicious<br />Foie Gras<br />
		                </div>
		                
		            </div>
		            <div data-fillmode="1" data-p="816.0">
		                <img data-u="image" src="/resources/img/banner/bastille/pate_nice.jpg" />
		                <div style="position:absolute;top:50px;left:50px;width:200px;height:40px;font-size:32px;color:#000000;line-height:1.2;text-align:center;">French pate<br />
		                </div>
		                
		            </div>
		            <div data-fillmode="1" data-p="170.00">
		                <img data-u="image" src="/resources/img/banner/bastille/duck_mousse.jpg" />
		                <div style="position:absolute;top:50px;left:50px;width:200px;height:40px;font-size:32px;color:#000000;line-height:1.2;text-align:center;">Duck mousse<br />
		                </div>
		                
		            </div>
		            <div data-p="170.00">
		                <img data-u="image" src="/resources/img/banner/bastille/slide_cheese.jpg" />
		                <div style="position:absolute;top:100px;left:47px;width:200px;height:40px;font-size:48px;font-weight:400;color:#000000;line-height:1.2;text-align:center;">Selection <br />of tasty <br />chees<br />
		                </div>
		                
		            </div>
		            <div data-p="170.00">
		                <img data-u="image" src="/resources/img/banner/bastille/slide_macaron.jpg" />
		                
		            </div>
		        </div>
		        <!-- Bullet Navigator -->
		        <div data-u="navigator" class="jssorb054" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
		            <div data-u="prototype" class="i" style="width:16px;height:16px;">
		                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
		                    <path class="b" d="M11400,13800H4600c-1320,0-2400-1080-2400-2400V4600c0-1320,1080-2400,2400-2400h6800 c1320,0,2400,1080,2400,2400v6800C13800,12720,12720,13800,11400,13800z"></path>
		                </svg>
		            </div>
		        </div>
		        <!-- Arrow Navigator -->
		        <div data-u="arrowleft" class="jssora081" style="width:30px;height:40px;top:0px;left:30px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
		            <svg viewbox="2000 0 12000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
		                <path class="c" d="M4800,14080h6400c528,0,960-432,960-960V2880c0-528-432-960-960-960H4800c-528,0-960,432-960,960 v10240C3840,13648,4272,14080,4800,14080z"></path>
		                <path class="a" d="M6860.8,8102.7l1693.9,1693.9c28.9,28.9,63.2,43.4,102.7,43.4s73.8-14.5,102.7-43.4l379-379 c28.9-28.9,43.4-63.2,43.4-102.7c0-39.6-14.5-73.8-43.4-102.7L7926.9,8000l1212.2-1212.2c28.9-28.9,43.4-63.2,43.4-102.7 c0-39.6-14.5-73.8-43.4-102.7l-379-379c-28.9-28.9-63.2-43.4-102.7-43.4s-73.8,14.5-102.7,43.4L6860.8,7897.3 c-28.9,28.9-43.4,63.2-43.4,102.7S6831.9,8073.8,6860.8,8102.7L6860.8,8102.7z"></path>
		            </svg>
		        </div>
		        <div data-u="arrowright" class="jssora081" style="width:30px;height:40px;top:0px;right:30px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
		            <svg viewbox="2000 0 12000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
		                <path class="c" d="M11200,14080H4800c-528,0-960-432-960-960V2880c0-528,432-960,960-960h6400 c528,0,960,432,960,960v10240C12160,13648,11728,14080,11200,14080z"></path>
		                <path class="a" d="M9139.2,8102.7L7445.3,9796.6c-28.9,28.9-63.2,43.4-102.7,43.4c-39.6,0-73.8-14.5-102.7-43.4 l-379-379c-28.9-28.9-43.4-63.2-43.4-102.7c0-39.6,14.5-73.8,43.4-102.7L8073.1,8000L6860.8,6787.8 c-28.9-28.9-43.4-63.2-43.4-102.7c0-39.6,14.5-73.8,43.4-102.7l379-379c28.9-28.9,63.2-43.4,102.7-43.4 c39.6,0,73.8,14.5,102.7,43.4l1693.9,1693.9c28.9,28.9,43.4,63.2,43.4,102.7S9168.1,8073.8,9139.2,8102.7L9139.2,8102.7z"></path>
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
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="single-process">
					<!-- process Icon -->
					<div class="picon">
						<i class="fa fa-truck"></i>
					</div>
					<!-- process Content -->
					<div class="process_content">
						<h3>Free Shipping over $150</h3>
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

			
		