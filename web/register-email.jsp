<%-- 
    Document   : register
    Created on : Jan 13, 2025, 12:32:16 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US">

    <head>

        <title>TIMI - Register</title>
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
        <script>
            function validateForm(event) {
                if (validateEmail() === false) {
                    alert("Invalid Email. Try again!");
                    event.preventDefault();
                }
                if (checkEmail() === false) {
                    alert("Invalid Email. Try again!");
                    event.preventDefault();
                }
            }

            function checkEmail() {
                const emailToCheck = document.getElementById('email').value;
                const err = document.getElementById('duplicated-email');
                const emailArray = <%=request.getAttribute("emailArray")%>;
                if (emailArray.includes(emailToCheck)) {
                    err.style.display = 'block';
                    return false;
                } else {
                    err.style.display = 'none';
                    return true;
                }
            }

            // Function to validate phone number
            function validateEmail() {
                const email = document.getElementById('email').value;
                const err = document.getElementById('err-email');
                const emailRegex = /^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$/;
                if (emailRegex.test(email)) {
                    err.style.display = 'none';
                    return true;
                } else {
                    err.style.display = 'block';
                    return false;
                }
                ;
            }
        </script>
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
                    <a href="/timibank/home" class="mil-logo">
                        <img src="img/logo1.png" alt="Plax" width="200">
                    </a>
                    <nav class="mil-top-menu">
                        <ul>
                            <li class="mil-has-children">
                                <a href="/timibank/home">Home</a>
                                <ul>
                                    <li><a href="index.jsp">Mở tài khoản</a></li>
                                    <li><a href="home-2.jsp">Gửi tiết kiệm</a></li>
                                    <li><a href="home-3.jsp">Type 3</a></li>
                                    <li><a href="home-4.jsp">Type 4</a></li>
                                    <li><a href="home-5.jsp">Type 5</a></li>

                                </ul>
                            </li>
                            <li>
                                <a href="about">About</a>
                            </li>
                            <li>
                                <a href="services.jsp">Services</a>
                            </li>
                            <li>
                                <a href="#.">Blog</a>
                                <ul>
                                    <li><a href="blog.jsp">Blog list</a></li>
                                    <li><a href="publication.jsp">Blog details</a></li>
                                </ul>
                            </li>
                            <li>
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
                    <div class="mil-menu-buttons">
                        <div class="mil-menu-btn">
                            <span></span>
                        </div>
                    </div>
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
                                    <h2 class="mil-mb-60" style="font-family: serif">Register with Timi Bank</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- banner end -->

                <!-- register form -->
                <div class="mil-blog-list mip-p-0-160">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-5">
                                <form action="register-email" method="post" onsubmit="validateForm(event)">
                                    <input type="text" class="mil-input mil-up mil-mb-15" name="email" placeholder="Email (___@___.___)" id="email" oninput="validateEmail(); checkEmail()" required>
                                    <div id="err-email" style="color: red; display: none">Email has to follow type: ___@___.___</div>
                                    <div id="duplicated-email" style="color: red; display: none">Email already exists. Please choose another!</div>
                                    <div class="mil-up mil-mb-30">
                                        <button type="submit" class="mil-btn mil-md mil-fw">Create Account</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- register form end -->

                <div class="mil-space-fix"></div>

            </div>
            <!-- content end -->
        </div>
        <!-- wrapper end -->

        <script>
            // Function to update image preview
            function updateImagePreview(url) {
                const preview = document.getElementById('imagePreview');
                preview.src = url;
            }
        </script>
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
