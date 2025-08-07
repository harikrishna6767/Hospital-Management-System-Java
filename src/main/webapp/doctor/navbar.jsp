<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

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
            <a href="index.jsp">Arogya Seva</a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="index.jsp">HOME</a></li>
                <li class="nav-item"><a class="nav-link active" href="patient.jsp">PATIENT</a></li>
                <li class="nav-item">
                    <div class="dropdown">
                        <button class="btn btn-success dropdown-toggle" type="button"
                            id="dropdownMenuButton1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="fas fa-user-circle"></i> ${doctObj.fullName}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
                            <li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
