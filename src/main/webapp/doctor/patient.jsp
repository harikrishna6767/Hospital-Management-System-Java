<%@page import="com.org.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@page import="com.org.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Details</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
    .paint-card {
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        border-radius: 15px;
        animation: fadeInDown 1s ease-in-out;
    }
  body {
        background: linear-gradient(270deg, #e0f7fa, #ffffff, #e3f2fd);
        background-size: 600% 600%;
        animation: backgroundShift 20s ease infinite;
        font-family: 'Segoe UI', sans-serif;
    }
    @keyframes fadeInDown {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .table th, .table td {
        vertical-align: middle;
        text-align: center;
    }

    .table thead {
        background: #0d6efd;
        color: white;
        font-size: 16px;
    }

    .table tbody tr:hover {
        background-color: #f1f1f1;
        transform: scale(1.01);
        transition: all 0.2s ease-in-out;
    }

    .heading-style {
        font-size: 28px;
        font-weight: 600;
        text-align: center;
        margin-bottom: 20px;
        color: #0d6efd;
        text-shadow: 1px 1px 2px #ccc;
    }

    .btn-comment {
        background-color: #0d6efd;
        border: none;
        color: white;
        padding: 4px 12px;
        border-radius: 4px;
        transition: 0.3s;
    }

    .btn-comment:hover {
        background-color: #084298;
        transform: scale(1.05);
    }

    .btn-comment:disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }
</style>
</head>
<body>

    <c:if test="${empty doctObj }">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="container mt-5">
        <div class="card paint-card">
            <div class="card-body">
                <p class="heading-style">Patient Details</p>

                <c:if test="${not empty errorMsg}">
                    <p class="fs-4 text-center text-danger">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>

                <c:if test="${not empty succMsg}">
                    <p class="fs-4 text-center text-success">${succMsg}</p>
                    <c:remove var="succMsg" scope="session" />
                </c:if>

                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Full Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Age</th>
                            <th scope="col">Appointment Date</th>
                            <th scope="col">Email</th>
                            <th scope="col">Mob No</th>
                            <th scope="col">Diseases</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Doctor d = (Doctor) session.getAttribute("doctObj");
                        AppointmentDao dao = new AppointmentDao();
                        List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                        for (Appointment ap : list) {
                        %>
                        <tr>
                            <th><%=ap.getFullName()%></th>
                            <td><%=ap.getGender()%></td>
                            <td><%=ap.getAge()%></td>
                            <td><%=ap.getAppoinDate()%></td>
                            <td><%=ap.getEmail()%></td>
                            <td><%=ap.getPhNo()%></td>
                            <td><%=ap.getDiseases()%></td>
                            <td><%=ap.getStatus()%></td>
                            <td>
                                <% if ("Pending".equals(ap.getStatus())) { %>
                                    <a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-comment">Comment</a>
                                <% } else { %>
                                    <button class="btn btn-comment" disabled>Comment</button>
                                <% } %>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
