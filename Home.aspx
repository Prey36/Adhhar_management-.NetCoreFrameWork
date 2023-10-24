﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Addhar_management.Home" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Roboto');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
        }

        .navigation {
            height: 55px;
            background: black;
        }

        .brand {
            position: absolute; 
            float: left;
            line-height: 55px;
            text-transform: uppercase;
            font-size: 1.4em;
        }

            .brand a, .brand a:visited {
                color: #ffffff;
                text-decoration: none;
            }

        .nav-container {
            max-width: 1000px;
            margin: 0 auto;
        }

        nav {
            float: right;
        }

            nav ul {
                list-style: none;
                margin: 0;
                padding: 0;
            }

                nav ul li {
                    float: left;
                    position: relative;
                }
                .asp-btn {
                    border: none;
                }

                    nav ul li a, nav ul li a:visited, .asp-btn, asp-btn:visited {
                        display: block;
                        padding: 0 20px;
                        line-height: 55px;
                        color: #fff;
                        background: #262626;
                        text-decoration: none;
                    }

                    nav ul li a, .asp-btn {
                        background: transparent;
                        color: #FFF;
                    }

                        nav ul li a:hover, nav ul li a:visited:hover, .asp-btn:hover, .asp-btn:visited:hover {
                            background: #2581DC;
                            color: #ffffff;
                        }

        .navbar-dropdown li a {
            background: #2581DC;
        }

        nav ul li a:not(:only-child):after, nav ul li a:visited:not(:only-child):after {
            padding-left: 4px;
            content: ' \025BE';
        }

        nav ul li ul li {
            min-width: 190px;
        }

            nav ul li ul li a {
                padding: 15px;
                line-height: 20px;
            }

        .navbar-dropdown {
            position: absolute;
            display: none;
            z-index: 1;
            background: #fff;
            box-shadow: 0 0 35px 0 rgba(0,0,0,0.25);
        }
        /* Mobile navigation */
        .nav-mobile {
            display: none;
            position: absolute;
            top: 0;
            right: 0;
            background: transparent;
            height: 55px;
            width: 70px;
        }

        @media only screen and (max-width: 800px) {
            .nav-mobile {
                display: block;
            }

            nav {
                width: 100%;
                padding: 55px 0 15px;
            }

                nav ul {
                    display: none;
                }

                    nav ul li {
                        float: none;
                    }

                        nav ul li a {
                            padding: 15px;
                            line-height: 20px;
                            background: #262626;
                        }

                        nav ul li ul li a {
                            padding-left: 30px;
                        }

            .navbar-dropdown {
                position: static;
            }

            @media screen and (min-width:800px) {
                .nav-list {
                    display: block !important;
                }
            }

            #navbar-toggle {
                position: absolute;
                left: 18px;
                top: 15px;
                cursor: pointer;
                padding: 10px 35px 16px 0px;
            }

                #navbar-toggle span, #navbar-toggle span:before, #navbar-toggle span:after {
                    cursor: pointer;
                    border-radius: 1px;
                    height: 3px;
                    width: 30px;
                    background: #ffffff;
                    position: absolute;
                    display: block;
                    content: '';
                    transition: all 300ms ease-in-out;
                }

                    #navbar-toggle span:before {
                        top: -10px;
                    }

                    #navbar-toggle span:after {
                        bottom: -10px;
                    }

                #navbar-toggle.active span {
                    background-color: transparent;
                }

                    #navbar-toggle.active span:before, #navbar-toggle.active span:after {
                        top: 0;
                    }

                    #navbar-toggle.active span:before {
                        transform: rotate(45deg);
                    }

                    #navbar-toggle.active span:after {
                        transform: rotate(-45deg);
                    }
        }

        .card-horizontal {
            display: flex;
            flex: 1 1 auto;
        }

        .main-footer {
            padding: 70px 0;
            display: flex;
            justify-content: space-evenly;
            background-color: #19302E;
        }

            .main-footer ul {
                list-style: none;
            }

            .main-footer h1 {
                font-size: 22px;
                line-height: 117%;
                color: #ffffff;
                margin-bottom: 10px;
                font-weight: 500;
            }

            .main-footer h2 {
                color: #ffffff;
                font-weight: 500;
            }

            .main-footer ul li a {
                color: #ffffffcc;
                text-decoration: none;
            }

        footer {
            background-color: #19302E;
            border-top: 1px solid #6EB981;
            font-size: 17px;
            padding: 15px 5px;
            color: #ffffff;
            text-align: center;
        }

            footer a {
                text-decoration: none;
                color: #ffffff;
            }

        .logoinfo p {
            color: #6EB981;
            font-size: 17px;
            margin-top: 5px;
        }

        .contact-details {
            margin-top: 20px;
        }

            .contact-details li {
                list-style: none;
                margin: 10px 0;
            }

                .contact-details li a {
                    text-decoration: none;
                    color: #f1f1f1;
                }

            .contact-details .fa {
                color: #f1f1f1;
                margin-right: 10px;
            }

        .sociallogos {
            padding: 20px 0;
        }

            .sociallogos .logobox a {
                padding: 0 10px;
                text-decoration: none;
                color: #ffffff;
                font-size: 22px;
            }

        .com ul li {
            padding: 5px 0;
        }

        @media only screen and (max-width: 749px) {
            .main-footer {
                padding: 20px;
                display: grid;
                grid-template-columns: 1fr 1fr;
            }

            .info {
                padding: 20px 0;
            }
        }

        @media (max-width: 480px) {
            .main-footer {
                grid-template-columns: 1fr;
            }

            .sociallogos {
                padding: 20px 0;
            }

            .com {
                padding: 20px 0;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
    <script>
        (function ($) {
            $(function () {

                //  open and close nav
                $('#navbar-toggle').click(function () {
                    $('nav ul').slideToggle();
                });


                // Hamburger toggle
                $('#navbar-toggle').on('click', function () {
                    this.classList.toggle('active');
                });


                // If a link has a dropdown, add sub menu toggle.
                $('nav ul li a:not(:only-child)').click(function (e) {
                    $(this).siblings('.navbar-dropdown').slideToggle("slow");

                    // Close dropdown when select another dropdown
                    $('.navbar-dropdown').not($(this).siblings()).hide("slow");
                    e.stopPropagation();
                });


                // Click outside the dropdown will remove the dropdown class
                $('html').click(function () {
                    $('.navbar-dropdown').hide();
                });
            });
        })(jQuery);
    </script>
    <form runat="server" id="form1">
    <section class="navigation">
        <div class="nav-container">
            <div class="brand">
                <img src="https://upload.wikimedia.org/wikipedia/en/thumb/c/cf/Aadhaar_Logo.svg/1200px-Aadhaar_Logo.svg.png" alt="logo" height="55px" width="55px" />
            </div>
            <nav>
                <div class="nav-mobile"><a id="navbar-toggle" href="#!"><span></span></a></div>
                <ul class="nav-list">
                    <li>
                        <a href="Home.aspx">Home</a>
                    </li>
                    <li>
                        <a href="about.html">About</a>
                    </li>

                    <li>
                        <a href="DisplayAdhar.aspx">Your Adhar</a>
                    </li>
                    <li>
                        <asp:Button ID="logoutButton" runat="server" Text="Logout" OnClick="LogOut_Click" CssClass="asp-btn"/>
                    </li>
                    <li>
                        <a href="Contact.aspx">Contact</a>
                    </li>
                </ul>
            </nav>
        </div>
    </section>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="https://cdn.inc42.com/wp-content/uploads/2018/07/RSS-feature.jpg" alt="First slide" height="500px" width="100%">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://www.hindustantimes.com/ht-img/img/2023/02/13/550x309/aadharcardfile16590031303691663755772893_1676276238866_1676276259689_1676276259689.jpg" alt="Second slide" height="500px" width="100%">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://www.godigit.com/content/dam/godigit/directportal/en/contenthm/Aadhaar-card-guide.jpg" alt="Third slide" height="500px" width="100%">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div><br><br>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <div class="container-fluid">
        <h2 style="margin-left: 40%;">
            Aadhar Development
        </h2>
        <div class="row">
            <div class="col-12 mt-3">
                <div class="card">
                    <div class="card-horizontal">
                        <div class="img-square-wrapper">
                            <img class="" src="https://blog.tax2win.in/wp-content/uploads/2019/02/Aadhaar-Card-Enrolment-Form.jpg" alt="Card image cap" height="200px" width="350px">
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Create new Adhar Card <Details></Details></h4>
                            <p class="card-text">You can create new aadhar card by providing valid details of the personal information here you can register for the application for the new aadhar card.</p>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="createaadhar.aspx">Create Aadhar</a>
                        <!-- <small class="text-muted">Last updated 3 mins ago</small> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mt-3">
                <div class="card">
                    <div class="card-horizontal">
                        <div class="img-square-wrapper">
                            <img class="" src="https://www.mppeb.org/wp-content/uploads/2023/03/New-Aadhaar-Card-Update-2023.jpg" alt="Card image cap" height="200px" width="350px">
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Update Adhar Card <Details></Details></h4>
                            <p class="card-text">If you have to make any changes into the aadhar then you can update your personal information andf you will get your new aadhar card. </p>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="Updateadhar.aspx">Update Aadhar</a>
                        <!-- <small class="text-muted">Last updated 3 mins ago</small> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mt-3">
                <div class="card">
                    <div class="card-horizontal">
                        <div class="img-square-wrapper">
                            <img class="" src="https://www.godigit.com/content/dam/godigit/directportal/en/contenthm/document-required-for-aadhaar-card.jpg" alt="Card image cap" height="200px" width="350px">
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Upload Document for  Aadhar Card as your document would be verified and as the document would be verified then your adhar card will be provided to you. <Details></Details></h4>
                            <p class="card-text"></p>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="Uploaddocs.aspx">Upload Document</a>
                        <!-- <small class="text-muted">Last updated 3 mins ago</small> -->
                    </div>
                </div>
            </div>
        </div>
    </div><br><br><br>
    <section id="footer">
        <div class="main-footer">
            <div class="logoinfo" data-aos="fade-up">
                <h2>AADHAR</h2>
                <!-- <p>By Nikhil</p> -->

                <div class="contact-details">
                    <h1>Contact Us</h1>
                    <li>
                        <div class="fa fa-phone"></div><a href="tel:+911800567897">+91 1800 567 897</a>
                    </li>
                    <li>
                        <div class="fa fa-envelope"></div><a href="mailto:help@aadhar.gov.in">help@aadhar.gov.in</a>
                    </li>
                    </li>
                </div>
            </div>
            <div class="com " data-aos="fade-up">
                <h1>About</h1>
                <ul>
                    <li><a href="wadhome.html">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="myadhar.html">My Adhar</a></li>

                </ul>
            </div>
            <div class="info" data-aos="fade-up">
                <h1>Social Media</h1>
                <div class="sociallogos">
                    <div class="logobox">
                        <a href="#" class="fa fa-instagram"></a>
                        <a href="#" class="fa fa-linkedin"></a>
                        <a href="#" class="fa fa-facebook"></a>
                        <a href="#" class="fa fa-youtube-play"></a>
                    </div>
                </div>
            </div>
        </div>
        <footer>© Your Copyright 2022 All Rights Reserved</footer>
    </section>
    </form>
</body>
</html>
