<%@page import="com.org.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	border-radius: 15px;
	animation: fadeInUp 1s ease;
}
 body {
        background: linear-gradient(270deg, #e0f7fa, #ffffff, #e3f2fd);
        background-size: 600% 600%;
        animation: backgroundShift 20s ease infinite;
        font-family: 'Segoe UI', sans-serif;
    }
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

.card-body input,
.card-body select {
	border-radius: 10px;
	transition: all 0.3s ease-in-out;
}

.card-body input:focus,
.card-body select:focus {
	box-shadow: 0 0 5px #007bff;
	transform: scale(1.02);
}

.btn {
	border-radius: 10px;
	transition: transform 0.2s ease;
}

.btn:hover {
	transform: scale(1.03);
}

.card {
	padding: 20px;
}

.text-center {
	margin-bottom: 10px;
}
</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row justify-content-center">
			<!-- Change Password -->
			<div class="col-md-4 mb-4">
				<div class="card paint-card">
					<p class="text-center fs-4 fw-bold text-primary">Change Password</p>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label class="form-label">Enter New Password</label>
								<input type="text" name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Old Password</label>
								<input type="text" name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctObj.id }" name="uid">
							<button class="btn btn-success w-100">Change Password</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Edit Profile -->
			<div class="col-md-6">
				<div class="card paint-card">
					<p class="text-center fs-4 fw-bold text-primary">Edit Profile</p>
					<c:if test="${not empty succMsgd }">
						<p class="text-center text-success">${succMsgd}</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd }">
						<p class="text-center text-danger">${errorMsgd}</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" name="fullname" class="form-control" value="${doctObj.fullName }" required>
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" name="dob" class="form-control" value="${doctObj.dob }" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" name="qualification" class="form-control" value="${doctObj.qualification }" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" class="form-control" required>
									<option>${doctObj.specialist }</option>
									<%
									SpecialistDao dao = new SpecialistDao();
									List<Specalist> list = dao.getAllSpecialist();
									for (Specalist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="text" name="email" class="form-control" value="${doctObj.email }" readonly required>
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label>
								<input type="text" name="mobno" class="form-control" value="${doctObj.mobNo }" required>
							</div>

							<input type="hidden" name="id" value="${doctObj.id }">
							<button type="submit" class="btn btn-primary w-100">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
