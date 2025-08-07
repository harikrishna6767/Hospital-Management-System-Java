<%@page import="com.org.entity.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@page import="com.org.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		background: linear-gradient(135deg, #e0f7fa, #f3e5f5);
		background-size: 400% 400%;
		animation: gradientShift 15s ease infinite;
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
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container mt-5">
		<div class="card paint-card">
			<div class="card-body">
				<p class="heading-style">Patient Details</p>
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						AppointmentDao dao = new AppointmentDao();
						DoctorDao dao2 = new DoctorDao();
						List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorsById(ap.getDoctorId());
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getAddress()%></td>
							<td><%=ap.getStatus()%></td>
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
