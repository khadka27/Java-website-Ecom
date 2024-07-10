<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .error-container {
            text-align: center;
            padding: 40px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #e74c3c;
            font-size: 36px;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .btn {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<!-- Error page to handle any error shown -->
    <div class="error-container">
        <h1>Error</h1>
        <%
    String errorMessage = request.getParameter("error");
    if (errorMessage != null && !errorMessage.isEmpty()) {
%>
    <div style="color: #cc0000;" class="error-message ">
        <%= errorMessage %>
    </div>
<%
    }
%>
        <p>An error occurred while processing your request.</p>
        <button class="btn" onclick="window.history.back()">Go Back</button>
    </div>
</body>
</html>
    