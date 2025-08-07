<div class="container-fluid p-4 text-center text-white" id="footer">
    <p class="footer-text mb-0">&copy; 2025 Arogya Seva. All Rights Reserved.</p>
    <p>
        <a href="#" class="footer-link text-white-50">Privacy Policy</a> | 
        <a href="#" class="footer-link text-white-50">Terms & Conditions</a>
    </p>
    <a href="contact.jsp" class="btn btn-light mt-3 contact-btn">Contact Us</a>
</div>

<style>
    /* Footer Styling */
    #footer {
        background-color: #007b8a; /* Matched to header color */
        padding-top: 30px;
        padding-bottom: 30px;
        opacity: 0;
        animation: fadeInFooter 2s ease-in-out forwards;
    }

    /* Footer Text */
    .footer-text {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
        animation: fadeInText 2s ease-in-out 0.5s forwards;
    }

    /* Footer Links */
    .footer-link {
        text-decoration: none;
        color: #ffffff;
        font-weight: 500;
        margin: 0 10px;
        transition: color 0.3s ease, transform 0.3s ease;
    }

    .footer-link:hover {
        color: #b2f0f6; /* Soft light on hover */
        transform: translateY(-5px);
    }

    /* Contact Button */
    .contact-btn {
        background-color: #28a745;
        color: white;
        font-size: 16px;
        padding: 10px 20px;
        border-radius: 5px;
        border: none;
        transition: background-color 0.3s ease, transform 0.3s ease;
        animation: fadeInButton 2s ease-in-out 1s forwards;
    }

    .contact-btn:hover {
        background-color: #218838;
        transform: scale(1.05);
    }

    /* Key Animations */
    @keyframes fadeInFooter {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @keyframes fadeInText {
        from {
            opacity: 0;
            transform: translateY(10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes fadeInButton {
        from {
            opacity: 0;
            transform: translateY(10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
