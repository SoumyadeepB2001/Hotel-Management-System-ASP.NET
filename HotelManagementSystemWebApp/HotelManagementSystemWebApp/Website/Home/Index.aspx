<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HotelManagementSystemWebApp.Website.Home.Index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HOTEL CRYSTAL SPRINGS</title>

    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/png" href="Images/favicon.png" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="CSS/fonts_googleapis.css" rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet" />

    <!-- boxicons -->
    <link
        rel="stylesheet"
        href="https://unpkg.com/boxicons@latest/css/boxicons.min.css" />

    <!-- Bootstrap 5 CDN Links -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous" />
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    <!-- Link Swiper's CSS -->
    <link
        rel="stylesheet"
        href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <!-- Icon Font Stylesheet -->
    <link
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
        rel="stylesheet" />
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
        rel="stylesheet" />

    <!-- Custom File's Link -->
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/responsive.css" />
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="100">
    <form id="form1" runat="server">
        <div>
            <!-- Navbar Start -->
            <header>
                <a href="#" class="logo">
                    <img src="./images/logo.png" />
                </a>

                <ul class="navbar">
                    <li><a href="#Home" class="nav-link active">Home</a></li>
                    <li><a href="#About" class="nav-link">About</a></li>
                    <li><a href="#Rooms" class="nav-link">Rooms</a></li>
                    <li><a href="#Services" class="nav-link">Services</a></li>
                    <li><a href="#Gallery" class="nav-link">Gallery</a></li>
                    <li><a href="#Contact" class="nav-link">Contact</a></li>
                </ul>

                <div class="header-icons">
                    <!-- Bars -->
                    <div class="bx bx-menu" id="menu-icons"></div>

                    <img id="user_pic" src="./images/Acc/no_img.png" class="user-pic" onclick="toggleMenu()" />

                    <a href="/Website/Sign-in/sign_in.aspx" runat="server" id="sign_in" visible="false">Sign-in</a>

                    <div class="sub-menu-wrap" id="subMenu" runat="server" visible="false">
                        <div class="sub-menu">
                            <div class="user-info">
                                <img src="./images/Acc/no_img.png" />
                                <h6 id="user_profile" runat="server"></h6>
                            </div>
                            <hr />

                            <a href="Profile/edit.aspx" class="sub-menu-link">
                                <img src="images/Acc/profile.png" />
                                <p>Edit Profile</p>
                                <span>></span>
                            </a>
                            <a href="Profile/bookings.aspx" class="sub-menu-link">
                                <img src="images/Acc/booking.png" />
                                <p>See your bookings</p>
                                <span>></span>
                            </a>
                            <a href="Profile/changepassword.aspx" class="sub-menu-link">
                                <img src="images/Acc/setting.png" />
                                <p>Change Password</p>
                                <span>></span>
                            </a>
                            <a href="#" class="sub-menu-link" runat="server" id="sign_out" onserverclick="sign_out_ServerClick">
                                <img src="images/Acc/logout.png" />
                                <p>Sign-out</p>
                                <span>></span>
                            </a>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Navbar End -->

            <!-- Banner Start -->
            <section id="Home" class="banner_wrapper p-0">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div
                            class="swiper-slide"
                            style="background-image: url(./Images/slider/Hotel.jpg)">
                            <div class="slide-caption text-center">
                                <div>
                                    <h1>WELCOME TO CRYSTAL SPRINGS</h1>
                                    <p>
                                        Where luxury meets unparalleled hospitality, creating unforgettable moments.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div
                            class="swiper-slide"
                            style="background-image: url(./Images/slider/Inside_Hotel.jpg)">
                            <div class="slide-caption text-center">
                                <div>
                                    <h1>WELCOME TO CRYSTAL SPRINGS</h1>
                                    <p>
                                        Enter a world of enchantment and rejuvenation at Crystal Springs Hotel, where serenity meets luxury.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div
                            class="swiper-slide"
                            style="background-image: url(./Images/slider/home-slide1.jpg)">
                            <div class="slide-caption text-center">
                                <div>
                                    <h1>WELCOME TO CRYSTAL SPRINGS</h1>
                                    <p>
                                        Discover the jewel of tranquility nestled amidst breathtaking vistas at Crystal Springs Hotel.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div
                            class="swiper-slide"
                            style="background-image: url(./Images/slider/home-slide2.jpg)">
                            <div class="slide-caption text-center">
                                <div>
                                    <h1>WELCOME TO CRYSTAL SPRINGS</h1>
                                    <p>
                                        Prepare to be mesmerized by the allure of Crystal Springs Hotel, where elegance and nature intertwine in perfect harmony.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div
                            class="swiper-slide"
                            style="background-image: url(./Images/slider/home-slide3.jpg)">
                            <div class="slide-caption text-center">
                                <div>
                                    <h1>WELCOME TO CRYSTAL SPRINGS</h1>
                                    <p>
                                        Experience the epitome of refined elegance and impeccable service as you step into Crystal Springs Hotel.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div
                            class="swiper-slide"
                            style="background-image: url(./Images/slider/Dinning.jpg)">
                            <div class="slide-caption text-center">
                                <div>
                                    <h1>WELCOME TO CRYSTAL SPRINGS</h1>
                                    <p>
                                        Uncover the secret of pure bliss and untainted luxury at Crystal Springs Hotel, where dreams come to life in shimmering splendor.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div
                            class="swiper-slide"
                            style="background-image: url(./Images/slider/Pool.jpg)">
                            <div class="slide-caption text-center">
                                <div>
                                    <h1>WELCOME TO CRYSTAL SPRINGS</h1>
                                    <p>
                                        Indulge in the perfect blend of style, comfort, and personalized service at Crystal Springs Hotel.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="container booking-area">
                    <div class="row">
                        <div class="col-lg mb-3 mb-lg-0">
                            <asp:TextBox ID="txt_check_in" runat="server" class="form-control" TextMode="Date">Check-in date</asp:TextBox>
                        </div>
                        <div class="col-lg mb-3 mb-lg-0">
                            <asp:TextBox ID="txt_check_out" runat="server" class="form-control" TextMode="Date">Check-out date</asp:TextBox>
                        </div>
                        <div class="col-lg mb-3 mb-lg-0">
                            <asp:DropDownList ID="ddl_adults" runat="server" class="form-select">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg mb-3 mb-lg-0">
                            <asp:DropDownList ID="ddl_children" runat="server" class="form-select">
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg mb-3 mb-lg-0">
                            <asp:Button ID="btn_avail" runat="server" Text="Check Availability" class="main-btn rounded-2 px-lg-3" OnClick="btn_avail_Click" />
                        </div>
                    </div>
                </div>
            </section>
            <!-- Banner End -->

            <!-- About Start -->
            <section id="About" class="about_wrapper">
                <div class="container">
                    <div class="row flex-lg-row flex-column-reverse">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h3>Welcome to
              <span>
                  <br class="d-none d-lg-block" />
                  CRYSTAL SPRINGS</span>
                            </h3>
                            <p>
                                Welcome to Crystal Springs Hotel, the epitome of relaxation and indulgence. Nestled amidst breathtaking natural beauty, our sanctuary beckons you to unwind and escape the pressures of everyday life. From the moment you step into our elegant oasis, you will be enveloped in an ambiance of tranquility and serenity. Immerse yourself in our meticulously designed spaces, where every detail is crafted to enhance your sense of well-being.
                            </p>
                            <p>
                                Let the gentle sounds of nature and the soothing touch of our attentive staff transport you to a world where time stands still. Indulge in our luxurious amenities, from rejuvenating spa treatments to exquisite dining experiences that tantalize your taste buds. At Crystal Springs Hotel, we strive to create an unforgettable journey for each and every guest, where relaxation and indulgence become a way of life.
                            </p>
                        </div>
                        <div class="col-lg-6 mb-lg-0 ps-lg-4 text-center">
                            <img src="Images/about-img.png" class="img-fluid" alt="About" />
                        </div>
                    </div>
                </div>
            </section>
            <!-- About End -->

            <!-- Rooms Start -->
            <section class="room" id="Rooms">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12 section-title text-center mb-5">
                            <h6>What We can do for You</h6>
                            <h3>Our Favourite Rooms</h3>
                        </div>
                    </div>
                </div>
                <div class="swiper room-slider">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/room-1.jpg" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Experience pure comfort and impeccable hospitality in the embrace of our thoughtfully appointed rooms.
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/room-2.jpg" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Embrace the allure of tranquility as you immerse yourself in the enchanting ambiance of our rooms.
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/room-3.jpg" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Unveil the perfect blend of sophistication and comfort in our meticulously crafted rooms. <br /> &nbsp
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/room-4.jpg" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Awaken your senses to a new standard of luxury as you enter our inviting and lavish rooms. <br /> &nbsp
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/room-5.jpg" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Step into a realm of personalized luxury, where our rooms are designed to exceed your expectations.
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/room-6.jpg" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Find your haven of relaxation and style in our rooms, where every moment is curated for your utmost comfort.
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/1.png" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Unwind in the lap of luxury, where our rooms redefine the art of relaxation. <br /> &nbsp
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/2.png" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Discover your sanctuary of style and comfort in our meticulously designed rooms. <br /> &nbsp
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide slide">
                            <div class="image">
                                <span class="price">$99.99/night</span>
                                <img src="Images/room/3.png" alt="" />
                            </div>
                            <div class="content">
                                <h3>Exclusive Rooms</h3>
                                <p>
                                    Indulge in blissful serenity and escape to a world of refined elegance in our exquisite rooms. <br /> &nbsp 
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </section>
            <!-- Rooms End -->

            <!-- Services section -->

            <!-- Service Start -->
            <section id="Services">
                <div class="container">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12 section-title text-center mb-5">
                                <h6>What We can do for You</h6>
                                <h3>Our Services</h3>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="service-item rounded pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-wifi text-primary mb-4"></i>
                                        <h5 style="font-family: serif">Free Wi-Fi</h5>
                                        <p>
                                            Stay connected and enjoy uninterrupted connectivity with our complimentary high-speed Wi-Fi, ensuring you're always in touch with what matters most.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                                <div class="service-item rounded pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-car text-primary mb-4"></i>
                                        <h5 style="font-family: serif">Valet Service</h5>
                                        <p>
                                            Experience seamless elegance and convenience with our premier valet service, where your arrival is greeted with exceptional care and efficiency.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                                <div class="service-item rounded pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-book text-primary mb-4"></i>
                                        <h5 style="font-family: serif">Library</h5>
                                        <p>
                                            Immerse yourself in a world of literary wonders and enrich your stay with our complimentary library, where captivating stories await to transport you to new realms of imagination.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                                <div class="service-item rounded pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-swimmer text-primary mb-4"></i>
                                        <h5 style="font-family: serif">Swimming Pool</h5>
                                        <p>
                                            Dive into blissful relaxation and make a splash in our pristine swimming pool, where the sun-kissed waters beckon you to unwind and indulge.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="service-item rounded pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-utensils text-primary mb-4"></i>
                                        <h5 style="font-family: serif">Restaurant</h5>
                                        <p>
                                            Savor exquisite culinary delights and embark on a gastronomic journey in our renowned restaurant, where flavors come alive and memories are made with every bite.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                                <div class="service-item rounded pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-tshirt text-primary mb-4"></i>
                                        <h5 style="font-family: serif">Laundry Service</h5>
                                        <p>
                                            Experience the convenience of our efficient laundry service, ensuring your garments are impeccably cared for, allowing you to focus on making the most of your stay.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                                <div class="service-item rounded pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-directions text-primary mb-4"></i>
                                        <h5 style="font-family: serif">Travel Guides</h5>
                                        <p>
                                            Unleash the spirit of adventure and immerse yourself in the local culture with our expert travel guides, who will lead you on unforgettable explorations, unlocking hidden gems along the way.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                                <div class="service-item rounded pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-tv text-primary mb-4"></i>
                                        <h5 style="font-family: serif">Free OTT</h5>
                                        <p>
                                            Enjoy an array of captivating entertainment at your fingertips with our complimentary OTT channels, providing endless hours of immersive viewing pleasure during your stay.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Service End -->

            <!-- Gallary-Start -->
            <section id="Gallery" class="gallery_wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 section-title text-center mb-5">
                            <h6>Best Pictures Of Our Hotel</h6>
                            <h3>Our Gallery</h3>
                        </div>
                    </div>
                    <div class="row g-0">
                        <div class="col-lg-3 col-md-6 gallery-item">
                            <img src="./Images/gallery/1.png" class="img-fluid w-100" alt="#" />
                            <div class="gallery-item-content"></div>
                        </div>
                        <div class="col-lg-3 col-md-6 gallery-item">
                            <img src="./Images/gallery/2.png" class="img-fluid w-100" alt="#" />
                            <div class="gallery-item-content"></div>
                        </div>
                        <div class="col-lg-3 col-md-6 gallery-item">
                            <img src="./Images/gallery/3.png" class="img-fluid w-100" alt="#" />
                            <div class="gallery-item-content"></div>
                        </div>
                        <div class="col-lg-3 col-md-6 gallery-item">
                            <img src="./Images/gallery/4.png" class="img-fluid w-100" alt="#" />
                            <div class="gallery-item-content"></div>
                        </div>
                        <div class="col-md-6 gallery-item">
                            <img src="./Images/gallery/5.png" class="img-fluid w-100" alt="#" />
                            <div class="gallery-item-content"></div>
                        </div>
                        <div class="col-md-6 gallery-item">
                            <img src="./Images/gallery/6.png" class="img-fluid w-100" alt="#" />
                            <div class="gallery-item-content"></div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Gallary-end -->

            <!-- Footer Start -->
            <footer>
                <div class="contactUS con" id="Contact">
                    <div class="title">
                        <h2>Contact Us</h2>
                    </div>
                    <div class="box">
                        <!-- Form -->
                        <div class="contact form">
                            <h3>Send a Message</h3>
                            <div>
                                <div class="formBox">
                                    <div class="row50">
                                        <div class="inputBox">
                                            <span>First Name</span>
                                            <asp:TextBox ID="txt_f_name" runat="server" placeholder="Enter Your First Name"></asp:TextBox>
                                        </div>
                                        <div class="inputBox">
                                            <span>Last Name</span>
                                            <asp:TextBox ID="txt_l_name" runat="server" placeholder="Enter Your Last Name"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row50">
                                        <div class="inputBox">
                                            <span>Email</span>
                                            <asp:TextBox ID="txt_email" runat="server" placeholder="Enter Your Email"></asp:TextBox>
                                        </div>
                                        <div class="inputBox">
                                            <span>Mobile</span>
                                            <asp:TextBox ID="txt_mobile" runat="server" placeholder="Enter Your Phone No."></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row100">
                                        <div class="inputBox">
                                            <span>Message</span>
                                            <asp:TextBox ID="txt_message" runat="server" TextMode="MultiLine" placeholder="Write Your Message Here..."></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row100">
                                        <div class="inputBox">
                                            <asp:Button ID="btn_submit" runat="server" Text="Send" OnClick="btn_submit_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Info -->
                        <div class="contact info">
                            <h3>Contact Info</h3>
                            <div class="infoBox">
                                <div>
                                    <span>
                                        <ion-icon name="location"></ion-icon>
                                    </span>
                                    <p>1 JBS Halden Avenue, Kolkata
                                        <br />
                                        INDIA</p>
                                </div>
                                <div>
                                    <span>
                                        <ion-icon name="mail"></ion-icon>
                                    </span>
                                    <a href="mailto:support@crystalsprings.com">support@crystalsprings.com</a>
                                </div>
                                <div>
                                    <span>
                                        <ion-icon name="call"></ion-icon>
                                    </span>
                                    <a href="tel:+916287501349">+91 628 750 1349</a>
                                </div>

                                <!-- Social Media Links -->
                                <ul class="sci" style="padding-left: 0">
                                    <li>
                                        <a href="https://www.facebook.com/" target="_blank">
                                            <ion-icon name="logo-facebook" id="fb"></ion-icon>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.instagram.com/" target="_blank">
                                            <ion-icon name="logo-instagram" id="ins"></ion-icon>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://twitter.com/" target="_blank">
                                            <ion-icon name="logo-twitter" id="tw"></ion-icon>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.youtube.com/" target="_blank">
                                            <ion-icon name="logo-youtube" id="yt"></ion-icon>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Map -->
                        <div class="contact map">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1896.4534680097588!2d88.3971879134686!3d22.544282089998294!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1688474532277!5m2!1sen!2sin"
                                width="600"
                                height="450"
                                style="border: 0"
                                allowfullscreen=""
                                loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
                <div class="container-fluid copyright-section">
                    <p>Copyright <a href="#">© CRYSTAL SPRINGS HOTEL.</a> All Rights Reserved</p>
                </div>
            </footer>
            <!-- Footer End -->
        </div>
    </form>
</body>

<!-- Bootstrap 5 JS CDN Links -->
<script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- ionicons -->
<script
    type="module"
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script
    nomodule
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- Custom Js Link -->
<script src="JavaScript/Index.js"></script>
</html>
