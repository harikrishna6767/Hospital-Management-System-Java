<%@page import="com.org.entity.Appointment"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Comment</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
	border-radius: 15px;
	animation: fadeInDown 1s ease-in-out;
	padding: 20px;
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

.heading-style {
	font-size: 28px;
	font-weight: 600;
	text-align: center;
	margin-bottom: 20px;
	color: #0d6efd;
	text-shadow: 1px 1px 2px #ccc;
}

label {
	font-weight: 500;
}

textarea.form-control {
	resize: none;
}
</style>
</head>
<body>

<c:if test="${empty doctObj}">
	<c:redirect url="../doctor_login.jsp" />
</c:if>

<%@include file="navbar.jsp"%>

<div class="container mt-5">
	<div class="card paint-card">
		<div class="card-body">
			<p class="heading-style">Patient Comment</p>

			<%
				int id = Integer.parseInt(request.getParameter("id"));
				AppointmentDao dao = new AppointmentDao();
				Appointment ap = dao.getAppointmentById(id);
			%>

			<form class="row" action="../updateStatus" method="post">
				<div class="col-md-6 mb-3">
					<label>Patient Name</label> 
					<input type="text" readonly value="<%=ap.getFullName()%>" class="form-control">
				</div>

				<div class="col-md-6 mb-3">
					<label>Age</label> 
					<input type="text" readonly value="<%=ap.getAge()%>" class="form-control">
				</div>

				<div class="col-md-6 mb-3">
					<label>Mobile Number</label> 
					<input type="text" readonly value="<%=ap.getPhNo()%>" class="form-control">
				</div>

				<div class="col-md-6 mb-3">
					<label>Diseases</label> 
					<input type="text" readonly value="<%=ap.getDiseases()%>" class="form-control">
				</div>

				<div class="col-md-12 mb-3">
					<label>Comment</label>
					<textarea required name="comm" class="form-control" rows="3"></textarea>
				</div>

				<input type="hidden" name="id" value="<%=ap.getId()%>"> 
				<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

				<div class="col-md-6 offset-md-3 mt-3">
					<button class="btn btn-primary w-100">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>
