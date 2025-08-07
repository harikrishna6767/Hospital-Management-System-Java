<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!-- CSS here -->
	<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="../assets/css/slicknav.css">
	<link rel="stylesheet" href="../assets/css/magnific-popup.css">
	<link rel="stylesheet" href="../assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="../assets/css/themify-icons.css">
	<link rel="stylesheet" href="../assets/css/slick.css">
	<link rel="stylesheet" href="../assets/css/nice-select.css">
	<link rel="stylesheet" href="../assets/css/style.css">
<style>
header{
height: 10%;
}
<style>
    .navbar {
        background-color: #4CAF50;
        padding: 15px 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        animation: slideDown 1s ease-out;
    }

    .navbar-toggler-icon {
        background-color: white;
    }

    .nav-link {
        color: white !important;
        font-size: 18px;
        font-weight: bold;
        padding: 12px 20px;
        transition: all 0.3s ease;
    }

    .nav-link:hover {
        background-color: green;
        transform: translateY(-3px);
    }

    .navbar-nav .nav-item {
        margin-right: 20px;
    }

    .dropdown-menu {
        background-color: blue;
        animation: fadeIn 0.5s ease-out;
    }

    .dropdown-item {
        color: white;
        font-size: 16px;
    }

    .dropdown-item:hover {
        background-color: yellow;
    }

    .btn-success {
        background-color: red !important;
        color: white !important;
        border: none;
        padding: 8px 16px;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .btn-success:hover {
        background-color: red;
        transform: scale(1.05);
    }

    @keyframes slideDown {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    .navbar .logo a {
        font-size: 24px;
        font-weight: bold;
        text-decoration: none;
        color: white;
        transition: color 0.3s ease;
    }

    .navbar .logo a:hover {
        color: yellow;
    }
</style>
</style>
<header>
	<!--? Header Start -->
	<div class="header-area">
		<div class="main-header header-sticky">
			<div class="container-fluid">
				<div class="row align-items-center">
					<!-- Logo -->
					<div class="col-xl-2 col-lg-2 col-md-1">
						<div class="logo">
							<a href="index1.jsp"><img src="assets/img/logo/logo.png"
								alt=""></a>
						</div>
					</div>
					<div class="col-xl-10 col-lg-10 col-md-10">
						<div
							class="menu-main d-flex align-items-center justify-content-end">

							<!-- Main-menu -->
							<c:if test="${empty userObj }">
								<div class="main-menu f-right d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a href="index1.jsp">Home</a></li>
											<li><a href="about.jsp">About</a></li>
											<li><a href="admin_login.jsp">Admin</a></li>
											<li><a href="doctor_login.jsp">Doctor</a></li>
											<li><a href="user_login.jsp">User</a></li>
										</ul>
									</nav>
								</div>

								<div class="header-right-btn f-right d-none d-lg-block ml-30">
									<a href="user_appointment.jsp" class="btn header-btn">Appointment</a>
								</div>
							</c:if> 
							<c:if test="${not empty userObj }">
							
								<div class="main-menu f-right d-none d-lg-block">

									<nav>

										<ul id="navigation">
										<li>
										<button type="button" class="btn-outline-info btn-rounded p-1">${userObj.fullname }</button>
										</li>
											<li><a href="view_appointment.jsp">view Appointment</a></li>
											<li><a href="change_password.jsp">change password</a></li>
											<li><a href="userLogout" class="">Logout</a></li>

										</ul>
									</nav>
								</div>
								<div class="header-right-btn f-right d-none d-lg-block ml-30">
									<a href="user_appointment.jsp" class="btn header-btn">Appointment</a>
								</div>
							</c:if>
						</div>
					</div>

					<!-- Mobile Menu -->
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<script src="../assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
