<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <div class="logo">
            <a href="index1.jsp">Arogya Seva</a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

                <c:if test="${empty userObj }">
                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="admin_login.jsp"><i
                            class="fas fa-sign-in-alt a2"></i> ADMIN</a></li>

                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="doctor_login.jsp">DOCTOR</a></li>
                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="user_appointment.jsp">APPOINTMENT</a></li>
                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="user_login.jsp">USER</a></li>
                </c:if>

                <c:if test="${not empty userObj }">
                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="user_appointment.jsp">APPOINTMENT</a></li>

                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="view_appointment.jsp">VIEW
                            APPOINTMENT</a></li>

                    <div class="dropdown">
                        <button class="p-2 m-1 btn-success dropdown-toggle" type="button"
                            id="dropdownMenuButton1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="fa-solid fa-circle-user"></i> ${userObj.fullname }
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="#">Change Password</a></li>
                            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
                        </ul>
                    </div>
                </c:if>

            </ul>
        </div>
    </div>
</nav>
