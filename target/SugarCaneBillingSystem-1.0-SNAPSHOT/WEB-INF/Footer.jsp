<%-- 
    Document   : Footer
    Created on : 10 Dec 2024, 10:50:09 am
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

    
    <!-- Footer -->
    <footer class="bg-dark text-white pt-5 pb-4">
        <div class="container-fluid">
            <div class="row">
                <!-- Logo -->
                <div class="col-md-3" id="logo">
                    <a href="#"><span class="text-success">SugarCane</span>Factory</a>
                    <div class="social-links mt-3">
                        <a href="#" class="text-white mr-2"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-white mr-2"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-white mr-2"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-white mr-2"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <!-- Direct Links -->
                <div class="col-md-3">
                    <strong>Direct Links</strong>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-muted">Home</a></li>
                        <li><a href="#" class="text-muted">Categories</a></li>
                        <li><a href="#" class="text-muted">Our Packages</a></li>
                        <li><a href="#" class="text-muted">SignIn</a></li>
                        <li><a href="#" class="text-muted">SignUp</a></li>
                    </ul>
                </div>
                <!-- Categories -->
                <div class="col-md-3">
                    <strong>Categories</strong>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-muted">Cat-1</a></li>
                        <li><a href="#" class="text-muted">Cat-2</a></li>
                        <li><a href="#" class="text-muted">Cat-3</a></li>
                        <li><a href="#" class="text-muted">Cat-4</a></li>
                        <li><a href="#" class="text-muted">Cat-5</a></li>
                    </ul>
                </div>
                <!-- Contact -->
                <div class="col-md-3">
                    <strong>Contact</strong>
                    <ul class="list-unstyled">
                        <li class="text-muted">Phone : +91 7249045716</li>
                        <li class="text-muted">Email :ashishadsule58@gmail.com</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>


    <style>
        footer {
            border-top: 5px solid #4eb060;
        }

        #logo a{
            color: #ffffff;
            font-size: 1.4rem;
            font-weight: 600;
            letter-spacing: 1px;
        }
        .social-links i {
            font-size: 1.2rem;
            transition: all ease 0.3s;
        }

        .social-links i:hover {
            color: #4eb060;
            transition: 0.3s;
        }

        .list-unstyled li a {
            font-size: 0.9rem;
            letter-spacing: 1px;
            transition: all ease 0.3s;
        }

        .list-unstyled li a:hover {
            color: #4eb060;
            transition: all ease 0.3s;
        }
        .list-unstyled li:hover {
            color: #4eb060;
            transition: all ease 0.3s;
        }
        .btn-primary {
        color: #212529;
        background-color:white;
        border-color:#038024;
        position: fixed;
        display: none;
        right: 30px;
        bottom: 30px;
        z-index: 11;
        animation: action 1s infinite alternate;
        display: inline;
    }
    .btn:not(:disabled):not(.disabled) {
        cursor: pointer;
    }
    .btn-primary:hover {
        color: #fff;
        background-color:#038024;
        border-color:#038024;
    }
    .col-md-3{
        color: wheat;
    }
    </style>
