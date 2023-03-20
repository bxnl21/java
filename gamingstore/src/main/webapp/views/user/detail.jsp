<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>${game.title}</title>

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
		        
		        <li><a href="#">Game</a></li>
		        
		        
		        <li><span class="fa fa-angle-right"></span></li>
		        
		        <li><span>${game.title}</span></li>
		        
		    </ul>
		</div>
		<div class="nk-gap-1"></div>
		<!-- END: Breadcrumbs -->
		
		        
		
		        
		<div class="container">
    <div class="row vertical-gap">
        <div class="col-lg-8">
            <div class="nk-store-product">
                <div class="row vertical-gap">
                    <div class="col-md-6">
                        <!-- START: Product Photos -->
                        <div class="nk-popup-gallery">
                            <div class="nk-gallery-item-box">
                                <a href="${game.poster}" class="nk-gallery-item" data-size="1200x554">
                                    <div class="nk-gallery-item-overlay"><span class="ion-eye"></span></div>
                                    <img src="${game.poster}" alt="">
                                </a>
                            </div>

                            <div class="nk-gap-1"></div>
                            <div class="row vertical-gap sm-gap">
                                <div class="col-6 col-md-4">
                                    <div class="nk-gallery-item-box">
                                        <a href="${game.poster}" class="nk-gallery-item" data-size="622x942">
                                            <div class="nk-gallery-item-overlay"><span class="ion-eye"></span></div>
                                            <img src="${game.poster}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-6 col-md-4">
                                    <div class="nk-gallery-item-box">
                                        <a href="${game.poster}" class="nk-gallery-item" data-size="1920x907">
                                            <div class="nk-gallery-item-overlay"><span class="ion-eye"></span></div>
                                            <img src="${game.poster}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-6 col-md-4">
                                    <div class="nk-gallery-item-box">
                                        <a href="${game.poster}" class="nk-gallery-item" data-size="1500x750">
                                            <div class="nk-gallery-item-overlay"><span class="ion-eye"></span></div>
                                            <img src="${game.poster}" alt="">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END: Product Photos -->
                    </div>
                    <div class="col-md-6">

                        <h2 class="nk-product-title h3">${game.title}</h2>

                        <div class="nk-product-description">
                            <p>${game.description}</p>
                        </div>

                        <!-- START: Add to Cart -->
                        <div class="nk-gap-2"></div>
                        <form action="#" class="nk-product-addtocart">
                            <div class="nk-product-price">
                            	<fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${game.price}" /> VND
                            </div>
                            <div class="nk-gap-1"></div>
                            <div class="input-group">
                                <input type="number" class="form-control" value="1" min="1" max="${game.quantity}">
                                <button class="nk-btn nk-btn-rounded nk-btn-color-main-1">Add to Cart</button>
                            </div>
                        </form>
                        <div class="nk-gap-3"></div>
                        <!-- END: Add to Cart -->

                        <!-- START: Meta -->
                        <div class="nk-product-meta">
                            <div><strong>SKU</strong>: 300-200-503</div>
                            <div><strong>Categories</strong>: <a href="#">online</a>, <a href="#">FPS</a>, <a href="#">MMO</a>, <a href="#">Action games</a></div>
                            <div><strong>Tags</strong>: <a href="#">blizzard</a>, <a href="#">action</a>, <a href="#">MMO</a></div>
                        </div>
                        <!-- END: Meta -->
                    </div>
                </div>

                <!-- START: Share -->
                <div class="nk-gap-2"></div>
                <div class="nk-post-share">
                    <span class="h5">Share Product:</span>
                    <ul class="nk-social-links-2">
                        <li><span class="nk-social-facebook" title="Share page on Facebook" data-share="facebook"><span class="fab fa-facebook"></span></span></li>
                        <li><span class="nk-social-google-plus" title="Share page on Google+" data-share="google-plus"><span class="fab fa-google-plus"></span></span></li>
                        <li><span class="nk-social-twitter" title="Share page on Twitter" data-share="twitter"><span class="fab fa-twitter"></span></span></li>
                        <li><span class="nk-social-pinterest" title="Share page on Pinterest" data-share="pinterest"><span class="fab fa-pinterest-p"></span></span></li>

                        <!-- Additional Share Buttons
                            <li><span class="nk-social-linkedin" title="Share page on LinkedIn" data-share="linkedin"><span class="fab fa-linkedin"></span></span></li>
                            <li><span class="nk-social-vk" title="Share page on VK" data-share="vk"><span class="fab fa-vk"></span></span></li>
                        -->
                    </ul>
                </div>
                <!-- END: Share -->

                <div class="nk-gap-2"></div>
                <!-- START: Tabs -->
                <div class="nk-tabs">
                    <div class="tab-content">

                        <!-- START: Tab Description -->
                        <div role="tabpanel" class="tab-pane fade show active" id="tab-description">
                            <p>${game.description}</p>
                        </div>
                        <!-- END: Tab Description -->

                        <!-- START: Tab Reviews -->
                        <div role="tabpanel" class="tab-pane fade" id="tab-reviews">
                            <div class="nk-gap-2"></div>
                            <!-- START: Reply -->
                            <h3 class="h4">Add a Review</h3>
                            <div class="nk-reply">
                                <form action="#" class="nk-form">
                                    <div class="row vertical-gap sm-gap">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control required" name="name" placeholder="Name *">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control required" name="title" placeholder="Title *">
                                        </div>
                                    </div>
                                    <div class="nk-gap-1"></div>
                                    <textarea class="form-control required" name="message" rows="5" placeholder="Your Review *" aria-required="true"></textarea>
                                    <div class="nk-gap-1"></div>
                                    <div class="nk-rating">
                                        <input type="radio" id="review-rate-5" name="review-rate" value="5">
                                        <label for="review-rate-5">
                                            <span><i class="far fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                        </label>

                                        <input type="radio" id="review-rate-4" name="review-rate" value="4">
                                        <label for="review-rate-4">
                                            <span><i class="far fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                        </label>

                                        <input type="radio" id="review-rate-3" name="review-rate" value="3">
                                        <label for="review-rate-3">
                                            <span><i class="far fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                        </label>

                                        <input type="radio" id="review-rate-2" name="review-rate" value="2">
                                        <label for="review-rate-2">
                                            <span><i class="far fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                        </label>

                                        <input type="radio" id="review-rate-1" name="review-rate" value="1">
                                        <label for="review-rate-1">
                                            <span><i class="far fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                        </label>
                                    </div>
                                    <button class="nk-btn nk-btn-rounded nk-btn-color-dark-3 float-right">Submit</button>
                                </form>
                            </div>
                            <!-- END: Reply -->

                            <div class="clearfix"></div>
                            <div class="nk-gap-2"></div>
                            <div class="nk-comments">
                                <!-- START: Review -->
                                <div class="nk-comment">
                                    <div class="nk-comment-meta">
                                        <img src="assets/images/avatar-2.jpg" alt="Witch Murder" class="rounded-circle" width="35"> by <a href="#">Witch Murder</a> in 20 September, 2018
                                        <div class="nk-review-rating" data-rating="4.5"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="far fa-star"></i></div>
                                    </div>
                                    <div class="nk-comment-text">
                                        <p>Upon replenish great rule. Were tree, given day him night Fruit it moveth all. First they're creature seasons and creature fill a it have fifth, their own subdue brought above divided.</p>

                                        <p>Behold it set, seas seas and meat divided Moveth cattle forth evening above moveth so, signs god a fruitful his after called that whose.</p>
                                    </div>
                                </div>
                                <!-- END: Review -->
                                <!-- START: Review -->
                                <div class="nk-comment">
                                    <div class="nk-comment-meta">
                                        <img src="assets/images/avatar-1.jpg" alt="Hitman" class="rounded-circle" width="35"> by <a href="#">Hitman</a> in 14 Jule, 2018
                                        <div class="nk-review-rating" data-rating="0.5"> <i class="fa fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i></div>
                                    </div>
                                    <div class="nk-comment-text">
                                        <p> I was awakened at daybreak by the charwoman, and having arrived at the inn, was at first placed inside the coach. :(</p>
                                    </div>
                                </div>
                                <!-- END: Review -->
                                <!-- START: Review -->
                                <div class="nk-comment">
                                    <div class="nk-comment-meta">
                                        <img src="assets/images/avatar-3.jpg" alt="Wolfenstein" class="rounded-circle" width="35"> by <a href="#">Wolfenstein</a> in 27 June, 2018
                                        <div class="nk-review-rating" data-rating="3.5"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i></div>
                                    </div>
                                    <div class="nk-comment-text">
                                        <p>Divided thing, land it evening earth winged whose great after. Were grass night. To Air itself saw bring fly fowl. Fly years behold spirit day greater of wherein winged and form. Seed open don't thing midst created dry every greater divided of, be man is. Second Bring stars fourth gathering he hath face morning fill. Living so second darkness. Moveth were male. May creepeth. Be tree fourth.</p>
                                    </div>
                                </div>
                                <!-- END: Review -->
                            </div>
                        </div>
                        <!-- END: Tab Reviews -->

                    </div>
                </div>
                <!-- END: Tabs -->
            </div>

        </div>
        <div class="col-lg-4">
            <!--
                START: Sidebar

                Additional Classes:
                    .nk-sidebar-left
                    .nk-sidebar-right
                    .nk-sidebar-sticky
            -->
            <aside class="nk-sidebar nk-sidebar-right nk-sidebar-sticky">
                <div class="nk-widget">
    <div class="nk-widget-content">
        <form action="#" class="nk-form nk-form-style-1" novalidate="novalidate">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Type something...">
                <button class="nk-btn nk-btn-color-main-1"><span class="ion-search"></span></button>
            </div>
        </form>
    </div>
</div>
<div class="nk-widget nk-widget-highlighted">
    <h4 class="nk-widget-title"><span><span class="text-main-1">Category</span> Menu</span></h4>
    <div class="nk-widget-content">
        <ul class="nk-widget-categories">
            <li><a href="#">RTS</a></li>
            <li><a href="#">Action</a></li>
            <li><a href="#">RPG</a></li>
            <li><a href="#">MMO</a></li>
        </ul>
    </div>
</div>

            </aside>
            <!-- END: Sidebar -->
        </div>
    </div>
</div>
		
		
		        
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
	</body>
</html>