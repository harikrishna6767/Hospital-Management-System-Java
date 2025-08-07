<%@page import="com.org.dao.DoctorDao"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>

<style>
    body {
        background: linear-gradient(270deg, #e0f2f1, #ffffff, #e3f2fd);
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

    .fs-3, .fs-4 {
        font-weight: 600;
        color: #004d40;
    }

    .dashboard-title {
        font-size: 2rem;
        font-weight: bold;
        color: #00695c;
        margin-bottom: 30px;
        text-align: center;
    }

    .section-title {
        font-size: 1.3rem;
        margin-top: 40px;
        margin-bottom: 20px;
        color: #00796b;
        border-bottom: 2px solid #00796b;
        display: inline-block;
    }

    .modal-title {
        font-weight: bold;
        color: #2e7d32;
    }

    .btn-primary {
        background-color: #00796b;
        border: none;
    }

    .btn-primary:hover {
        background-color: #004d40;
        transform: scale(1.05);
    }

    .card i {
        color: #00695c;
        margin-bottom: 12px;
    }

    .extra-info {
        font-size: 1rem;
        color: #555;
    }

</style>
</head>
<body>

<%@include file="navbar.jsp"%>

<c:if test="${ empty adminObj }">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<div class="container py-5">
    <p class="dashboard-title">Welcome to Admin Dashboard</p>

    <c:if test="${not empty errorMsg}">
        <p class="fs-3 text-center text-danger">${errorMsg}</p>
        <c:remove var="errorMsg" scope="session" />
    </c:if>

    <c:if test="${not empty succMsg}">
        <div class="fs-3 text-center text-success">${succMsg}</div>
        <c:remove var="succMsg" scope="session" />
    </c:if>

    <%
    DoctorDao dao = new DoctorDao();
    %> 

    <!-- Main Stats Section -->
    <div class="row g-4">
        <div class="col-md-3">
            <div class="card paint-card text-center p-3">
                <i class="fas fa-user-md fa-3x"></i>
                <p class="fs-4">Doctors<br><%=dao.countDoctor()%></p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card text-center p-3">
                <i class="fas fa-user-circle fa-3x"></i>
                <p class="fs-4">Users<br><%=dao.countUSer()%></p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card text-center p-3">
                <i class="far fa-calendar-check fa-3x"></i>
                <p class="fs-4">Appointments<br><%=dao.countAppointment()%></p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card text-center p-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <i class="fas fa-user-tag fa-3x"></i>
                <p class="fs-4">Specialists<br><%=dao.countSpecialist()%></p>
            </div>
        </div>
    </div>

    <!-- Extra Information Section -->
    <div class="row mt-5 g-4">
        <p class="section-title"></p>

        <div class="col-md-3">
            <div class="card paint-card text-center p-3">
                <i class="fas fa-heartbeat fa-2x"></i>
                <p class="fs-5">Active Doctors</p>
                <p class="extra-info">43 on-duty today</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card text-center p-3">
                <i class="fas fa-procedures fa-2x"></i>
                <p class="fs-5">Available Beds</p>
                <p class="extra-info">17 beds available</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card text-center p-3">
                <i class="fas fa-calendar-day fa-2x"></i>
                <p class="fs-5">Today's Appointments</p>
                <p class="extra-info">34 scheduled</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card text-center p-3">
                <i class="fas fa-ambulance fa-2x"></i>
                <p class="fs-5">Emergency Cases</p>
                <p class="extra-info">5 in ER</p>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Adding Specialist -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../addSpecialist" method="post">
                    <div class="form-group">
                        <label>Enter Specialist Name</label>
                        <input type="text" name="specName" class="form-control" required>
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
