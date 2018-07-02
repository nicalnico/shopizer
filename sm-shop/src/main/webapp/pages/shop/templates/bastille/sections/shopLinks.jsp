<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page session="false" %>

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet"> 


		<!-- CORE CSS -->
		<link href="<c:url value="/resources/templates/bastille/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">

		<!-- more fonts, cursor up -->
        <link href="<c:url value="/resources/templates/bastille/css/animate.css" />" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/templates/bastille/css/slippry.css" />" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/templates/bastille/css/jquery-ui.min.css" />" rel="stylesheet" type="text/css">
       

		<link href="<c:url value="/resources/templates/bastille/css/meanmenu.min.css" />" rel="stylesheet" type="text/css">
		<link href="<c:url value="/resources/templates/bastille/css/magnific-popup.css" />" rel="stylesheet" type="text/css">
		<link href="<c:url value="/resources/templates/bastille/css/magnific-popup.css" />" rel="stylesheet" type="text/css">
		<link href="<c:url value="/resources/templates/bastille/css/owl.carousel.css" />" rel="stylesheet" type="text/css">
		<link href="<c:url value="/resources/templates/bastille/css/linearicons-icon-font.min.css" />" rel="stylesheet" type="text/css">
		<link href="<c:url value="/resources/templates/bastille/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

		
		<link rel="icon" href="<c:url value="/resources/templates/bastille/img/favicon.ico"/>"> 
		
		<!--  Theme -->

		<link href="<c:url value="/resources/templates/bastille/css/style.css" />" rel="stylesheet" type="text/css">
		<link href="<c:url value="/resources/templates/bastille/css/template.css" />" rel="stylesheet" type="text/css">
		<link href="<c:url value="/resources/templates/bastille/css/responsive.css" />" rel="stylesheet" type="text/css">

		<script src="<c:url value="/resources/templates/bastille/js/vendor/modernizr-2.8.3.min.js" />"></script>
		<script src="<c:url value="/resources/templates/bastille/js/vendor/jquery-1.12.0.min.js" />"></script>
    
    	<!-- bastille and common css file -->
    	<link href="<c:url value="/resources/css/sm.css" />" rel="stylesheet">
    	<link href="<c:url value="/resources/css/showLoading.css" />" rel="stylesheet">
    	
    	
    	<script type="text/javascript">
	    	//show overlay wait
	    	function showTemplateLoading(element) {
	    		$.LoadingOverlay("show");
	    	}
	    	
	    	function hideTemplateLoading(element) {
	    		$.LoadingOverlay("hide", true);
	    	}
    
        </script>
    
    	<!-- ////////////// -->

    <!-- mini shopping cart template -->
    <script type="text/html" id="miniShoppingCartTemplate">
		{{#shoppingCartItems}}
			<tr id="{{productId}}" class="cart-product">
				<td>
			{{#image}}
					<img width="40" src="{{contextPath}}{{image}}">
			{{/image}}
			{{^image}}
					&nbsp
			{{/image}}
				</td>
				<td>{{quantity}}</td>
				<td>{{name}}</td>
				<td>{{price}}</td>
				<td><button productid="{{productId}}" class="close removeProductIcon" onclick="removeItemFromMinicart('{{id}}')">x</button></td>
			</tr>
		{{/shoppingCartItems}}
	</script>
	
	<c:if test="${requestScope.CONFIGS['google_analytics_url'] != null}">
	<!-- Google analytics -->	
	<script type="text/javascript">
	//<![CDATA[ 
		  <!-- google analytics -->
	  	   var _gaq = _gaq || [];
	  	   _gaq.push(['_setAccount', '<c:out value="${requestScope.CONFIGS['google_analytics_url']}"/>']);
	  	   _gaq.push(['_trackPageview']);
	  	   
	  	   (function() {
	    		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	   		 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  	   })();
	  	//]]> 
	</script>
	</c:if>
	
	<!--  May add specific google_adwords tag -->
	<c:if test="${requestScope.CONFIGS['google_analytics_url'] != null}">
		<!-- Global site tag (gtag.js) - Google AdWords: 802166772 -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=AW-802166772"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'AW-802166772');
		</script>
		
		<!-- BEGIN GCR Badge Code -->
		<script src="https://apis.google.com/js/platform.js?onload=renderBadge"
		  async defer>
		</script>
		
		<script>
		  window.renderBadge = function() {
		    var ratingBadgeContainer = document.createElement("div");
		      document.body.appendChild(ratingBadgeContainer);
		      window.gapi.load('ratingbadge', function() {
		        window.gapi.ratingbadge.render(
		          ratingBadgeContainer, {
		            // REQUIRED
		            "merchant_id": 123349391,
		            // OPTIONAL
		            "position": "INLINE"
		          });           
		     });
		  }
		</script>
		<!-- END GCR Badge Code -->		
	</c:if>
	
	<!--  May add specific facebook pixel tag -->
	<c:if test="${requestScope.CONFIGS['google_analytics_url'] != null}">
		<!-- Facebook Pixel Code -->
		<script>
		  !function(f,b,e,v,n,t,s)
		  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
		  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
		  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
		  n.queue=[];t=b.createElement(e);t.async=!0;
		  t.src=v;s=b.getElementsByTagName(e)[0];
		  s.parentNode.insertBefore(t,s)}(window, document,'script',
		  'https://connect.facebook.net/en_US/fbevents.js');
		  fbq('init', '225418511395725');
		  fbq('track', 'PageView');
		</script>
		<noscript><img height="1" width="1" style="display:none"
		  src="https://www.facebook.com/tr?id=225418511395725&ev=PageView&noscript=1"
		/></noscript>
		<!-- End Facebook Pixel Code -->
	</c:if>
	