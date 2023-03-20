<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>Cart</title>

    <meta name="description" content="GoodGames - Bootstrap template for communities and games store">
    <meta name="keywords" content="game, gaming, template, HTML template, responsive, Bootstrap, premium">
    <meta name="author" content="_nK">

    <link rel="icon" type="image/png" href="<c:url value='/templates/user/assets/images/favicon.png'/>">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7cOpen+Sans:400,700" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<c:url value='/templates/user/assets/vendor/bootstrap/dist/css/bootstrap.min.css'/>">
    <script defer src="<c:url value='/templates/user/assets/vendor/fontawesome-free/js/all.js'/>"></script>
    <script defer src="<c:url value='/templates/user/assets/vendor/fontawesome-free/js/v4-shims.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/templates/user/assets/vendor/ionicons/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/templates/user/assets/vendor/flickity/dist/flickity.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/user/assets/vendor/photoswipe/dist/photoswipe.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/user//assets/vendor/photoswipe/dist/default-skin/default-skin.css'/>">
    <link rel="stylesheet" href="<c:url value='/templates/user/assets/vendor/bootstrap-slider/dist/css/bootstrap-slider.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/templates/user/assets/vendor/summernote/dist/summernote-bs4.css'/>">
    <link rel="stylesheet" href="<c:url value='/templates/user/assets/css/goodgames.css'/>">
    <link rel="stylesheet" href="<c:url value='/templates/user/assets/css/custom.css'/>">
    <script src="<c:url value='/templates/user/assets/vendor/jquery/dist/jquery.min.js'/>"></script>
</head>
	<body>
		<header class="nk-header nk-header-opaque">
		<!-- START: Top Contacts -->
		<div class="nk-contacts-top">
		    <div class="container">
		        <div class="nk-contacts-right">
		            <ul class="nk-contacts-icons">
		                <li>
		                    <a href="#" data-toggle="modal" data-target="#modalLogin">
		                        <span class="fa fa-user"></span>
		                    </a>
		                </li>
		                <li>
			                	<a href="/gamingstore/cart?action=view">
			                    <span class="nk-cart-toggle">
			                        <span class="fa fa-shopping-cart"></span>
			                        <span class="nk-badge">${sessionScope.currentCart.totalQuantity}</span>
			                    </span>
			                    </a>
			                </li>
		            </ul>
		        </div>
		    </div>
		</div>
		<!-- END: Top Contacts -->
		   <nav class="nk-navbar nk-navbar-top nk-navbar-sticky nk-navbar-autohide">
		       <div class="container">
		           <div class="nk-nav-table">
		               
		               <a href="index.html" class="nk-nav-logo">
		                   <img src="<c:url value='/templates/user/assets/images/logo.png'/>" alt="GoodGames" width="199">
		               </a>
		               
		               <ul class="nk-nav nk-nav-right d-none d-lg-table-cell" data-nav-mobile="#nk-nav-mobile">
		       <c:choose>
            		<c:when test="${not empty sessionScope.currentUser}">
            			<li>
				           <a href="#">
				               Welcome, ${sessionScope.currentUser.username}
				           </a>
				       </li>
            			<li>
				           <a href="logout">
				               Logout
				           </a>
				       </li>
            		</c:when>
            	</c:choose>
		               </ul>
		           </div>
		       </div>
		   </nav>
		   <!-- END: Navbar -->
		
		</header>
		
		    
		    
		        <!--
		    START: Navbar Mobile
		
		    Additional Classes:
		        .nk-navbar-left-side
		        .nk-navbar-right-side
		        .nk-navbar-lg
		        .nk-navbar-overlay-content
		-->
		<div id="nk-nav-mobile" class="nk-navbar nk-navbar-side nk-navbar-right-side nk-navbar-overlay-content d-lg-none">
		    <div class="nano">
		        <div class="nano-content">
		            <a href="index.html" class="nk-nav-logo">
		                <img src="<c:url value='/templates/user/assets/images/logo.png'/>" alt="" width="120">
		            </a>
		            <div class="nk-navbar-mobile-content">
		                <ul class="nk-nav">
		                    <!-- Here will be inserted menu from [data-mobile-menu="#nk-nav-mobile"] -->
		                </ul>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- END: Navbar Mobile -->
		
		   
		
		   <div class="nk-main">
		       
		           <!-- START: Breadcrumbs -->
		<div class="nk-gap-1"></div>
		<div class="container">
		    <ul class="nk-breadcrumbs">
		        
		        
		        <li><a href="<c:url value='/index'/>">Home</a></li>
        
        
		        <li><span class="fa fa-angle-right"></span></li>
		        
		        <li><span>Cart</span></li>
		        
		    </ul>
		</div>
		<div class="nk-gap-1"></div>
		<!-- END: Breadcrumbs -->
		
		<div class="container">
    <div class="nk-store nk-store-cart">
        <div class="table-responsive">

            <!-- START: Products in Cart -->
            <table class="table nk-store-cart-products">
                <tbody>
                    <c:forEach items="${sessionScope.currentCart.details}" var="item">
	                        <tr>
	                            <td class="nk-product-cart-thumb">
	                                <a href="${item.value.poster}" class="nk-image-box-1 nk-post-image">
	                                    <img src="${item.value.poster}" alt="#" width="115">
	                                </a>
	                            </td>
	                            <td class="nk-product-cart-title">
	                                <h5 class="h6">Product:</h5>
	                                <div class="nk-gap-1"></div>
	
	                                <h2 class="nk-post-title h4">
	                                    <a href="/gamingstore/game?action=preview&id=${item.value.href}">${item.value.title}</a>
	                                </h2>
	                            </td>
	                            <td class="nk-product-cart-price">
	                                <h5 class="h6">Price:</h5>
	                                <div class="nk-gap-1"></div>
	
	                                <strong>
	                                	<fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${item.value.price}" /> VND
	                                </strong>
	                            </td>
	                            <td class="nk-product-cart-quantity">
	                                <h5 class="h6">Quantity:</h5>
	                                <div class="nk-gap-1"></div>
	
	                                <div class="nk-form">
	                                    <input type="number" class="form-control" value="${item.value.quantity}" min="1" max="21">
	                                </div>
	                            </td>
	                            <td class="nk-product-cart-total">
	                                <h5 class="h6">Total:</h5>
	                                <div class="nk-gap-1"></div>
	
	                                <strong><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${item.value.price * item.value.quantity}" /> VND</strong>
	                            </td>
	                            <td class="nk-product-cart-remove"><a href="#"><span class="ion-android-close"></span></a></td>
	                        </tr>
                        </c:forEach>
                </tbody>
            </table>
            <!-- END: Products in Cart -->

        </div>
        <div class="nk-gap-1"></div>
        <a class="nk-btn nk-btn-rounded nk-btn-color-white float-right" href="#">Update Cart</a>

        <div class="clearfix"></div>
        <div class="nk-gap-2"></div>
        <div class="row vertical-gap">
            <div class="col-md-6">


            </div>
            <div class="col-md-6">
                <!-- START: Cart Totals -->
                <h3 class="nk-title h4">Cart Totals</h3>
                <table class="nk-table nk-table-sm">
                    <tbody>
                        <tr class="nk-store-cart-totals-subtotal">
                            <td>
                                Total
                            </td>
                            <td>
                                <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${sessionScope.currentCart.totalPrice}" /> VND
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- END: Cart Totals -->
            </div>
        </div>

        <div class="nk-gap-2"></div>
        <button onclick="checkout()" class="nk-btn nk-btn-rounded nk-btn-color-main-1 float-right" href="store-checkout.html">Proceed to Checkout</button>
        <div class="clearfix"></div>
    </div>
</div>

<div class="nk-gap-2"></div>		        


		
		
		        
		            <!-- START: Footer -->
		<footer class="nk-footer">
		
		    <div class="container">
		        <div class="nk-gap-3"></div>
		        <div class="row vertical-gap">
		            <div class="col-md-6">
		                <div class="nk-widget">
		                    <h4 class="nk-widget-title"><span class="text-main-1">Contact</span> With Us</h4>
		                    <div class="nk-widget-content">
		                        <form action="php/ajax-contact-form.php" class="nk-form nk-form-ajax">
		                            <div class="row vertical-gap sm-gap">
		                                <div class="col-md-6">
		                                    <input type="email" class="form-control required" name="email" placeholder="Email *">
		                                </div>
		                                <div class="col-md-6">
		                                    <input type="text" class="form-control required" name="name" placeholder="Name *">
		                                </div>
		                            </div>
		                            <div class="nk-gap"></div>
		                            <textarea class="form-control required" name="message" rows="5" placeholder="Message *"></textarea>
		                            <div class="nk-gap-1"></div>
		                            <button class="nk-btn nk-btn-rounded nk-btn-color-white">
		                                <span>Send</span>
		                                <span class="icon"><i class="ion-paper-airplane"></i></span>
		                            </button>
		                            <div class="nk-form-response-success"></div>
		                            <div class="nk-form-response-error"></div>
		                        </form>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="nk-gap-3"></div>
		    </div>
		
		    <div class="nk-copyright">
		        <div class="container">
		            <div class="nk-copyright-left">
		                <a target="_blank" href="https://www.templateshub.net">Templates Hub</a>
		            </div>
		            <div class="nk-copyright-right">
		                <ul class="nk-social-links-2">
		                    <li><a class="nk-social-rss" href="#"><span class="fa fa-rss"></span></a></li>
		                    <li><a class="nk-social-twitch" href="#"><span class="fab fa-twitch"></span></a></li>
		                    <li><a class="nk-social-steam" href="#"><span class="fab fa-steam"></span></a></li>
		                    <li><a class="nk-social-facebook" href="#"><span class="fab fa-facebook"></span></a></li>
		                    <li><a class="nk-social-google-plus" href="#"><span class="fab fa-google-plus"></span></a></li>
		                    <li><a class="nk-social-twitter" href="#" target="_blank"><span class="fab fa-twitter"></span></a></li>
		                    <li><a class="nk-social-pinterest" href="#"><span class="fab fa-pinterest-p"></span></a></li>
		
		                </ul>
		            </div>
		        </div>
		    </div>
		</footer>
		<!-- END: Footer -->
		
		       
		   </div>
		
		   
		
		   
		       <!-- START: Page Background -->
		
		   <img class="nk-page-background-top" src="<c:url value='/templates/user/assets/images/bg-top-4.png'/>" alt="">
		   <img class="nk-page-background-bottom" src="<c:url value='/templates/user/assets/images/bg-bottom.png'/>" alt="">
		
		<!-- END: Page Background -->
		
		   
		
		   
		       <!-- START: Search Modal -->
		<div class="nk-modal modal fade" id="modalSearch" tabindex="-1" role="dialog" aria-hidden="true">
		    <div class="modal-dialog modal-sm" role="document">
		        <div class="modal-content">
		            <div class="modal-body">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span class="ion-android-close"></span>
		                </button>
		
		                <h4 class="mb-0">Search</h4>
		
		                <div class="nk-gap-1"></div>
		                <form action="#" class="nk-form nk-form-style-1">
		                    <input type="text" value="" name="search" class="form-control" placeholder="Type something and press Enter" autofocus>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- END: Search Modal -->
		   
		
		   
		       <!-- START: Login Modal -->
		<div class="nk-modal modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-hidden="true">
		    <div class="modal-dialog modal-sm" role="document">
		        <div class="modal-content">
		            <div class="modal-body">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span class="ion-android-close"></span>
		                </button>
		
		                <h4 class="mb-0"><span class="text-main-1">Sign</span> In</h4>
		
		                <div class="nk-gap-1"></div>
		                <form action="login" method="POST" class="nk-form text-white">
		                    <div class="row vertical-gap">
		                        <div class="col-md-6">
		                            Use username and password:
		
		                            <div class="nk-gap"></div>
		                            <input type="text" value="" name="username" class=" form-control" placeholder="Username">
		
		                            <div class="nk-gap"></div>
		                            <input type="password" value="" name="password" class="required form-control" placeholder="Password">
		                        </div>
		                        <div class="col-md-6">
		                            Or social account:
		
		                            <div class="nk-gap"></div>
		
		                            <ul class="nk-social-links-2">
		                                <li><a class="nk-social-facebook" href="#"><span class="fab fa-facebook"></span></a></li>
		                                <li><a class="nk-social-google-plus" href="#"><span class="fab fa-google-plus"></span></a></li>
		                                <li><a class="nk-social-twitter" href="#"><span class="fab fa-twitter"></span></a></li>
		                            </ul>
		                        </div>
		                    </div>
		
		                    <div class="nk-gap-1"></div>
		                    <div class="row vertical-gap">
		                        <div class="col-md-6">
		                            <button type="submit" class="nk-btn nk-btn-rounded nk-btn-color-white nk-btn-block">Sign In</button>
		                        </div>
		                        <div class="col-md-6">
		                            <div class="mnt-5">
		                                <small><a href="#">Forgot your password?</a></small>
		                            </div>
		                            <div class="mnt-5">
		                                <small><a href="#">Not a member? Sign up</a></small>
		                            </div>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- END: Login Modal -->
		
		   
		
		   
		<!-- START: Scripts -->
		
		<!-- Object Fit Polyfill -->
		<script src="<c:url value='/templates/user/assets/vendor/object-fit-images/dist/ofi.min.js'/>"></script>
		
		<!-- GSAP -->
		<script src="<c:url value='/templates/user/assets/vendor/gsap/src/minified/TweenMax.min.js'/>"></script>
		<script src="<c:url value='/templates/user/assets/vendor/gsap/src/minified/plugins/ScrollToPlugin.min.js'/>"></script>
		
		<!-- Popper -->
		<script src="<c:url value='/templates/user/assets/vendor/popper.js/dist/umd/popper.min.js'/>"></script>
		
		<!-- Bootstrap -->
		<script src="<c:url value='/templates/user/assets/vendor/bootstrap/dist/js/bootstrap.min.js'/>"></script>
		
		<!-- Sticky Kit -->
		<script src="<c:url value='/templates/user/assets/vendor/sticky-kit/dist/sticky-kit.min.js'/>"></script>
		
		<!-- Jarallax -->
		<script src="<c:url value='/templates/user/assets/vendor/jarallax/dist/jarallax.min.js'/>"></script>
		<script src="<c:url value='/templates/user/assets/vendor/jarallax/dist/jarallax-video.min.js'/>"></script>
		
		<!-- imagesLoaded -->
		<script src="<c:url value='/templates/user/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js'/>"></script>
		
		<!-- Flickity -->
		<script src="<c:url value='/templates/user/assets/vendor/flickity/dist/flickity.pkgd.min.js'/>"></script>
		
		<!-- Photoswipe -->
		<script src="<c:url value='/templates/user/assets/vendor/photoswipe/dist/photoswipe.min.js'/>"></script>
		<script src="<c:url value='/templates/user/assets/vendor/photoswipe/dist/photoswipe-ui-default.min.js'/>"></script>
		
		<!-- Jquery Validation -->
		<script src="<c:url value='/templates/user/assets/vendor/jquery-validation/dist/jquery.validate.min.js'/>"></script>
		
		<!-- Jquery Countdown + Moment -->
		<script src="<c:url value='/templates/user/assets/vendor/jquery-countdown/dist/jquery.countdown.min.js'/>"></script>
		<script src="<c:url value='/templates/user/assets/vendor/moment/min/moment.min.js'/>"></script>
		<script src="<c:url value='/templates/user/assets/vendor/moment-timezone/builds/moment-timezone-with-data.min.js'/>"></script>
		
		<!-- Hammer.js -->
		<script src="<c:url value='/templates/user/assets/vendor/hammerjs/hammer.min.js'/>"></script>
		
		<!-- NanoSroller -->
		<script src="<c:url value='/templates/user/assets/vendor/nanoscroller/bin/javascripts/jquery.nanoscroller.js'/>"></script>
		
		<!-- SoundManager2 -->
		<script src="<c:url value='/templates/user/assets/vendor/soundmanager2/script/soundmanager2-nodebug-jsmin.js'/>"></script>
		
		<!-- Seiyria Bootstrap Slider -->
		<script src="<c:url value='/templates/user/assets/vendor/bootstrap-slider/dist/bootstrap-slider.min.js'/>"></script>
		
		<!-- Summernote -->
		<script src="<c:url value='/templates/user/assets/vendor/summernote/dist/summernote-bs4.min.js'/>"></script>
		
		<!-- nK Share -->
		<script src="<c:url value='/templates/user/assets/plugins/nk-share/nk-share.js'/>"></script>
		
		<!-- GoodGames -->
		<script src="<c:url value='/templates/user/assets/js/goodgames.min.js'/>"></script>
		<script src="<c:url value='/templates/user/assets/js/goodgames-init.js'/>"></script>
		<!-- END: Scripts -->
		<script>
			function checkout() {
				$.ajax({
					url: '/gamingstore/cart?action=checkout',
					type: 'GET',
					dataType: 'json'
					}).then(function(data){
						alert('Your cart was created successfully');
						window.location.href = "http://localhost:8080/gamingstore/index";
					}).fail(function(data) {
						alert('Checkout failed, try again!');
					});	
			}
		</script>
	</body>
</html>