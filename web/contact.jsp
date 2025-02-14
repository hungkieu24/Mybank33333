<%-- 
    Document   : contact
    Created on : Jan 20, 2025, 12:39:59 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
   <head>

    <title>TIMI - Finance</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="HandheldFriendly" content="true">
    <meta name="author" content="bslthemes" />

    <!-- switzer font css -->
    <link rel="stylesheet" href="fonts/css/switzer.css" type="text/css" media="all">
    <!-- font awesome css -->
    <link rel="stylesheet" href="fonts/css/font-awesome.min.css" type="text/css" media="all">
    <!-- bootstrap grid css -->
    <link rel="stylesheet" href="css/plugins/bootstrap-grid.css" type="text/css" media="all">
    <!-- swiper css -->
    <link rel="stylesheet" href="css/plugins/swiper.min.css" type="text/css" media="all">
    <!-- magnific popup -->
    <link rel="stylesheet" href="css/plugins/magnific-popup.css" type="text/css" media="all">
    <!-- plax css -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon">
    <link rel="icon" href="img/favicon.png" type="image/x-icon">

</head>

<body>


    <!-- wrapper -->
    <div id="smooth-wrapper" class="mil-wrapper">

        <!-- preloader -->
       <div class="mil-preloader">
           
        </div>
        <!-- preloader end -->

        <!-- scroll progress -->
        <div class="mil-progress-track">
            <div class="mil-progress"></div>
        </div>
        <!-- scroll progress end -->

        <!-- back to top -->
        <div class="progress-wrap active-progress"></div>

        <!-- top panel end -->
        <div class="mil-top-panel">
            <div class="container">
                <a href="index.jsp" class="mil-logo">
                     <img src="img/logo1.png" alt="Plax" width="200">
                </a>
                <nav class="mil-top-menu">
                    <ul>
                        <li class="mil-has-children">
                            <a href="#.">Home</a>
                            <ul>
                               <li><a href="index.jsp">Mở tài khoản</a></li>
                                <li><a href="home-2.jsp">Gửi tiết kiệm</a></li>
                                <li><a href="home-3.jsp">Type 3</a></li>
                                <li><a href="home-4.jsp">Type 4</a></li>
                                <li><a href="home-5.jsp">Type 5</a></li>
                                
                            </ul>
                        </li>
                        <li>
                            <a href="about.jsp">About</a>
                        </li>
                        <li>
                            <a href="services.jsp">Services</a>
                        </li>
                        <li class="mil-has-children">
                            <a href="#.">Blog</a>
                            <ul>
                                <li><a href="blog.jsp">Blog list</a></li>
                                <li><a href="publication.jsp">Blog details</a></li>
                            </ul>
                        </li>
                        <li class="mil-active">
                            <a href="contact.jsp">Contact</a>
                        </li>
                        <li class="mil-has-children">
                            <a href="#.">Pages</a>
                            <ul>
                                <li><a href="career.jsp">Career</a></li>
                                <li><a href="career-details.jsp">Career details</a></li>
                                <li><a href="price.jsp">Pricing</a></li>
                                <li><a href="register.jsp">Register</a></li>
                                
                            </ul>
                        </li>
                    </ul>
                </nav>
                <c:if test="${sessionScope.account == null}">
                    <div class="mil-menu-buttons">
                        <a href="login.jsp" class="mil-btn mil-sm">Log in</a>
                        <a href="register.jsp" class="mil-btn mil-sm" style="margin-left: 10px">Register</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account != null}">

                    <nav class="mil-top-menu">
                        <ul>
                            <li class="mil-has-children ">
                                <a href="#." class="mil-btn mil-sm">My Account</a>
                                <ul>
                                    <li><a href="profile.jsp">My Profile</a></li>
                                    <li><a href="/audio/change_pass">Change Password</a></li>
                                    <li><a href="/audio/purchase">My Purchase</a></li>
                                    <li><a href="myfeedback">My Feedback</a></li>
                                    <li><a href="/audio/signout">Sign out</a></li>


                                </ul>
                            </li>   
                        </ul>


                    </nav>  


                </c:if>
            </div>
        </div>
        <!-- top panel end -->

        <!-- content -->
        <div id="smooth-content">

            <!-- banner -->
            <div class="mil-banner mil-banner-inner mil-dissolve">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-8">
                            <div class="mil-banner-text mil-text-center">
                               
                                <h2 >Connect with Us: We are Here to Help You</h2>
                                <ul class="mil-breadcrumbs mil-center">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li><a href="contact.jsp">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- banner end -->

            <!-- contact -->
            <div class="mil-blog-list mil-p-0-160">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-9">
                            <form action="contact" method="get">
                                <div class="row">
                                    <div class="col-md-6 mil-mb-30">
                                        <input class="mil-input mil-up" type="text" placeholder="Name" name="name" value="${sessionScope.account.fullName}">
                                    </div>
                                    <div class="col-md-6 mil-mb-30">
                                        <input class="mil-input mil-up" type="email" placeholder="Email" name="email" value="${sessionScope.account.email}">
                                    </div>
                                    <div class="col-xl-12 mil-mb-30 ">
                                        <textarea cols="30" rows="10" class="mil-up" placeholder="Message" name="message"></textarea>
                                    </div>
                                </div>
                                    <% if(request.getAttribute("error")!=null)  {%>
                                    <a style="color:red; font-style: italic"><%out.println(request.getAttribute("error"));%></a>
                                    <%}%>
                                    <br>
                                <div class="mil-up">
                                    <button type="submit" class="mil-btn mil-m">Send Message</button>
                                </div>
                            </form>
                            <div class="alert-success" style="display: none;"><h5>Thanks, your message is sent successfully.</h5></div>
                            <div class="mil-p-160-0">
                                <h5 class="mil-mb-30 mil-up">We are available on the following channels:</h5>
                                <p class="mil-text-m mil-soft mil-mb-10 mil-up">Address: 999 Rue du Cherche-Midi, 7755500666 Paris, France</p>
                                <p class="mil-text-m mil-soft mil-mb-10 mil-up">Telephone: +001 (808) 555-0111</p>
                                <p class="mil-text-m mil-soft mil-mb-10 mil-up">Fax: +001 (808) 555-0112</p>
                                <p class="mil-text-m mil-soft mil-up">Email: support@plax.network</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- contact end -->
            
            <!-- call to action -->
            <div class="mil-cta mil-up">
                <div class="container">
                    <div class="mil-out-frame mil-p-160-160" style="background-image: url(img/home-3/5.png)">
                        <div class="row justify-content-between align-items-center">
                            <div class="col-xl-7 mil-sm-text-center">
                                <h2 class="mil-light mil-mb-30 mil-up">Discover the freedom <br>of Total Financial Control</h2>
                                <p class="mil-text-m mil-mb-60 mil-dark-soft mil-up">Join Plax and take the first step towards a more <br> balanced and hassle-free financial life.</p>
                                <div class="mil-buttons-frame mil-up">
                                    <a href="#." class="mil-btn mil-md">App Store</a>
                                    <a href="#." class="mil-btn mil-border mil-md">Google Play</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- call to action end -->

            <!-- footer -->
            <footer class="mil-p-160-0">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3">
                            <a href="#." class="mil-footer-logo mil-mb-60">
                                <img src="img/logo-2.png" alt="Plax" width="28" height="32">
                            </a>
                        </div>
                        <div class="col-xl-3 mil-mb-60">
                            <h6 class="mil-mb-60">Usefull Links</h6>
                            <ul class="mil-footer-list">
                                <li class="mil-text-m mil-soft mil-mb-15">
                                    <a href="index.jsp">Home</a>
                                </li>
                                <li class="mil-text-m mil-soft mil-mb-15">
                                    <a href="about.jsp">About Us</a>
                                </li>
                                <li class="mil-text-m mil-soft mil-mb-15">
                                    <a href="contact.jsp">Contact Us</a>
                                </li>
                                <li class="mil-text-m mil-soft mil-mb-15">
                                    <a href="services.jsp">Services</a>
                                </li>
                                <li class="mil-text-m mil-soft mil-mb-15">
                                    <a href="price.jsp">Pricing</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xl-3 mil-mb-60">
                            <h6 class="mil-mb-60">Help</h6>
                            <ul class="mil-footer-list">
                                <li class="mil-text-m mil-soft mil-mb-15">
                                    999 Rue du Cherche-Midi, 7755500666 Paris, <br>France
                                </li>
                                <li class="mil-text-m mil-soft mil-mb-15">
                                    +001 (808) 555-0111
                                </li>
                                <li class="mil-text-m mil-soft mil-mb-15">
                                    support@plax.network
                                </li>
                            </ul>
                        </div>
                        <div class="col-xl-3 mil-mb-80">
                            <h6 class="mil-mb-60">Newsletter</h6>
                            <p class="mil-text-xs mil-soft mil-mb-15">Subscribe to get the latest news form us</p>
                            <form class="mil-subscripe-form-footer">
                                <input class="mil-input" type="email" placeholder="Email">
                                <button type="submit"><i class="far fa-envelope-open mil-dark"></i></button>
                                <div class="mil-checkbox-frame mil-mt-15">
                                    <div class="mil-checkbox">
                                        <input type="checkbox" id="checkbox-2" checked>
                                        <label for="checkbox-2"></label>
                                    </div>
                                    <p class="mil-text-xs mil-soft">Subscribe to get the latest news</p>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="mil-footer-bottom">
                        <div class="row">
                            <div class="col-xl-6">
                                <p class="mil-text-s mil-soft">© 2024 Plax Finance & Fintech Design</p>
                            </div>
                            <div class="col-xl-6">
                                <p class="mil-text-s mil-text-right mil-sm-text-left mil-soft">Developed by <a href="https://bslthemes.com" target="blank">bslthemes</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- footer end -->

        </div>
        <!-- content end -->
    </div>
    <!-- wrapper end -->

    <!-- jquery js -->
    <script src="js/plugins/jquery.min.js"></script>

    <!-- swiper css -->
    <script src="js/plugins/swiper.min.js"></script>
    <!-- gsap js -->
    <script src="js/plugins/gsap.min.js"></script>
    <!-- scroll smoother -->
    <script src="js/plugins/ScrollSmoother.min.js"></script>
    <!-- scroll trigger js -->
    <script src="js/plugins/ScrollTrigger.min.js"></script>
    <!-- scroll to js -->
    <script src="js/plugins/ScrollTo.min.js"></script>
    <!-- magnific -->
    <script src="js/plugins/magnific-popup.js"></script>
    <!-- plax js -->
    <script src="js/main.js"></script>

</body>
</html>
