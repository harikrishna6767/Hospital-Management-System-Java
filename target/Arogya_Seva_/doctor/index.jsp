<%@page import="com.org.entity.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
<%@include file="../component/allcss.jsp"%>

<style>
    body {
        background: linear-gradient(270deg, #e0f7fa, #ffffff, #e3f2fd);
        background-size: 600% 600%;
        animation: backgroundShift 20s ease infinite;
        font-family: 'Segoe UI', sans-serif;
    }

    @keyframes backgroundShift {
        0% {background-position: 0% 50%;}
        50% {background-position: 100% 50%;}
        100% {background-position: 0% 50%;}
    }

    .paint-card {
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        border-radius: 15px;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .paint-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
    }

    .dashboard-title {
        font-size: 2rem;
        font-weight: bold;
        color: #00695c;
        margin-bottom: 30px;
        text-align: center;
    }

    .fs-3, .fs-4 {
        font-weight: 600;
        color: #004d40;
    }

    .card i {
        color: #00695c;
        margin-bottom: 12px;
    }
</style>
</head>
<body>

<%@include file="navbar.jsp"%>

<c:if test="${ empty doctObj }">
    <c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%
Doctor d = (Doctor) session.getAttribute("doctObj");
DoctorDao dao = new DoctorDao();
%>

<div class="container py-5">
    <p class="dashboard-title">Welcome, Dr. <%=d.getFullName()%></p>

    <div class="row g-4 justify-content-center">
        <div class="col-md-4">
            <div class="card paint-card text-center p-3">
                <i class="fas fa-user-md fa-3x"></i>
                <p class="fs-4">All Doctors<br><%=dao.countDoctor()%></p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card text-center p-3">
                <i class="far fa-calendar-check fa-3x"></i>
                <p class="fs-4">Your Appointments<br><%=dao.countAppointmentByDocotrId(d.getId())%></p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
