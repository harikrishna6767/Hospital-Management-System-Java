<%@page import="com.org.dao.AppointmentDao"%>
<%@page import="com.org.entity.User"%>
<%@page import="com.org.entity.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@page import="com.org.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
/* Page background */
 body {
        background: linear-gradient(to right, #74ebd5, #9face6);
        font-family: 'Poppins', sans-serif;
    }

/* Appointment Card Styling */
.paint-card {
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
	border-radius: 15px;
	animation: fadeInUp 1s ease;
	transition: all 0.3s ease;
}

/* Fade animation */
@keyframes fadeInUp {
	from {
		opacity: 0;
		transform: translateY(30px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

/* Table Styling */
.table {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
}

.table th {
	background-color: #007bff;
	color: white;
	text-align: center;
	vertical-align: middle;
}

.table td {
	vertical-align: middle;
	text-align: center;
}

/* Hover effect for table rows */
.table tbody tr:hover {
	background-color: #f1f1f1;
	transition: background-color 0.3s ease;
}

/* Pending button styling */
.btn-warning {
	border-radius: 8px;
	font-weight: bold;
	animation: pulse 1.5s infinite;
}

/* Button animation */
@keyframes pulse {
	0% {
		transform: scale(1);
		box-shadow: 0 0 0 rgba(255, 193, 7, 0.7);
	}
	70% {
		transform: scale(1.05);
		box-shadow: 0 0 10px rgba(255, 193, 7, 0.7);
	}
	100% {
		transform: scale(1);
		box-shadow: 0 0 0 rgba(255, 193, 7, 0);
	}
}

/* Title styling */
.fs-4 {
	font-size: 1.5rem;
}

.text-success {
	font-weight: 600;
}

/* Container padding */
.container {
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
</head>
<body>

	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<%@include file="component/navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-10 m-auto">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment List</p>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
									User user = (User) session.getAttribute("userObj");
									AppointmentDao dao = new AppointmentDao();
									DoctorDao dao2 = new DoctorDao();
									List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId()) ;
									for (Appointment ap : list) {
										Doctor d = dao2.getDoctorsById(ap.getDoctorId()) ;
								%>
								<tr>
									<td><%=ap.getFullName()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td>
										<%
											if ("Pending".equals(ap.getStatus())) {
										%> 
										<a href="#" class="btn btn-sm btn-warning">Pending</a> 
										<% } else { %> 
										<span class="badge bg-success p-2"><%=ap.getStatus()%></span>
										<% } %>
									</td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
