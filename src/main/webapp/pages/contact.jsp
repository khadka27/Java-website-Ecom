<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact us</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        

        .contact-container {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            background: #fb923c;
        }
 
        .contact-left {
            display: flex;
            flex-direction: column;
            align-items: start;
            gap: 20px;
        }

        .contact-left-title h2 {
            font-weight: 600;
            color: #a363aa;
            font-size: 40px;
            margin-bottom: 5px;
        }

        .contact-left-title hr {
            border: none;
            width: 120px;
            height: 5px;
            background-color: #a363aa;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .contact-inputs {
            width: 400px;
            height: 50px;
            border: none;
            outline: none;
            padding-left: 25px;
            font-weight: 500;
            color: #666;
            border-radius: 50px;
        }

        .contact-left textarea {
            height: 140px;
            padding-top: 15px;
            border-radius: 20px;
        }

        .contact-inputs:focus {
            border: 2px solid #ff994f;
        }

        .contact-inputs::placeholder {
            color: #a9a9a9;
        }

        .contact-left button {
            display: flex;
            align-items: center;
            padding: 15px 30px;
            font-size: 16px;
            color: #fff;
            gap: 10px;
            border: none;
            border-radius: 50px;
            background: linear-gradient(270deg, #ff994f,#fa6d86 );
            cursor: pointer;
        }

        .contact-left button img {
            height: 15px;
        }

        .contact-right img {
            width: 500px;
        }
        
        @media (max-width: 800px) {
            .contact-inputs {
                width: 80vw;
            }
            .contact-right {
                display: none;
            }
        }

    </style>
</head>
<body>
<%@ include file="navigationbar.jsp"%>
    <div class="contact-container">
        <form action="https://api.web3forms.com/submit" method="POST" class="contact-left">
            <div class="contact-left-title">
                <h2>Get in touch</h2>
                <hr>
            </div>
            <input type="hidden" name="access_key" value="33055c6d-dec8-4d91-bca0-d7747a42199d">
            <input type="text" class="contact-inputs" name="name" placeholder="Your Name" required>
            <input type="email" class="contact-inputs" name="email" placeholder="Your Email" required>
            <textarea name="message" class="contact-inputs" placeholder="Your Message" required></textarea>
            <button type="submit">Submit<img src="<%=request.getContextPath()%>/assets/arrow_icon.png" alt=""></button>
        </form>
        <div class="contact-right">
            <img src="<%=request.getContextPath()%>/assets/right_img.png" alt="rightImage">
        </div>
    </div>
<%@ include file="footer.jsp"%>
</body>
</html> 
