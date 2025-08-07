<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@ include file="component/allcss.jsp"%>

<!-- Bootstrap & Custom CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f2f7fa;
        color: #222;
    }

    .section-title {
        text-align: center;
        margin-bottom: 40px;
        animation: fadeInDown 1s ease-in-out;
    }

    .section-title h2 {
        font-weight: 700;
        color: #007b8a;
    }

    .about-section {
        padding: 50px 20px 0 20px;
        background-color: #e0f7f9;
    }

    .department_area {
        padding: 30px 20px 60px 20px;
        background-color: #ffffff;
        margin-top: 0px; /* Removed gap */
    }

    .card.paint-card {
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 123, 138, 0.1);
        padding: 20px;
        transition: transform 0.4s ease;
        animation: zoomIn 0.8s ease;
    }

    .card.paint-card:hover {
        transform: translateY(-8px);
    }

    .testimonial-section {
        background: #e6f4f1;
        padding: 60px 20px;
        animation: fadeIn 1.2s ease-in;
    }

    .contact-section {
        background-color: #d1f2eb;
        padding: 50px 20px;
        text-align: center;
        animation: fadeInUp 1s ease-in;
    }

    .btn-contact {
        background-color: #007b8a;
        color: #fff;
        font-weight: 600;
        border-radius: 8px;
        padding: 12px 24px;
        transition: 0.3s ease-in-out;
    }

    .btn-contact:hover {
        background-color: #005f66;
    }

    /* Custom animations */
    @keyframes fadeInDown {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes zoomIn {
        from { opacity: 0; transform: scale(0.95); }
        to { opacity: 1; transform: scale(1); }
    }

</style>

</head>
<body>

<%@ include file="component/navbar.jsp"%>

<main>

<!-- About Us Section -->
<div class="container-fluid about-section">
    <div class="section-title">
        <h2>About Our Hospital</h2>
        <p>We provide quality healthcare with advanced technology and a compassionate approach.</p>
    </div>
</div>

<!-- Hospital Features / Departments Section -->
<div class="container-fluid department_area">
    <div class="section-title">
        <h2>Hospital Features</h2>
    </div>
    <div class="container">
        <div class="row">
            <% String[] features = {"100% Safety", "Clean Environment", "Friendly Doctors", "Medical Research", "24 x 7 Service", "Advanced Equipment"}; 
               for(int i=0; i<features.length; i++) { %>
            <div class="col-md-4 mb-4">
                <div class="card paint-card text-center">
                    <i class="fas fa-check-circle fa-2x text-primary mb-3"></i>
                    <p class="fs-5 fw-semibold"><%= features[i] %></p>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>

<!-- Testimonials Section -->
<div class="container testimonial-section">
    <div class="section-title">
        <h2>What Our Patients Say</h2>
    </div>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card paint-card">
                <p>"Very professional staff and caring atmosphere. I felt safe and comfortable throughout my treatment."</p>
                <p><strong>Shiva</strong></p>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card paint-card">
                <p>"Excellent facilities and 24/7 emergency service. Highly recommended for all healthcare needs."</p>
                <p><strong>Sashi</strong></p>
            </div>
        </div>
    </div>
</div>

<!-- Contact Section -->
<div class="container-fluid contact-section">
    <h2>Need Help or Emergency?</h2>
    <p>Call our helpline or book an appointment with our doctors today.</p>
    <a href="#" class="btn btn-contact">Contact Us</a>
</div>

</main>

<%@ include file="component/footer.jsp" %>

</body>
</html>
