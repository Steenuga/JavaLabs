<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<style>
    body {
        width: calc(100% - 2em);
        height: calc(100vh - 2em);
        display: inline-flex;
        justify-content: center;
        align-items: center;
        background: #f6f6f6;
    }
    form {
        background: white;
        display: flex;
        font-size: 20px;
        width: 35%;
        flex-direction: column;
        flex-wrap: wrap;
        justify-content: center;
        padding: 1em;
        box-shadow: 0 10px 12px -4px grey;
        border-radius: 1em;
    }
    form label {
        color: #36333a;
        font-size: 15px;
        margin-top: 0.5em;
    }
    .title {
        width: calc(100% - 2em);
        text-align: center;
        color: #36333a;
    }
    .input {
        width: calc(100%);
        font-size: 15px;
        background: rgb(210, 210, 210);
        border: none;
        border-bottom: 3px solid rgb(210, 210, 210);
        border-radius: 0.3em;
        padding: 12px 20px;
    }
    .input:focus {
        border-bottom: 3px solid black;
    }
    .button {
        background: black;
        color: white;
        border: 1px solid black;
        border-radius: 0.3em;
        font-size: 15px;
        margin-top: 1em;
        padding-top: 0.5em;
        padding-bottom: 0.5em;
        width: calc(100%);
        transition: 0.2s;
    }
    .button:hover {
        background: rgb(50, 50, 50);
        cursor: pointer;
    }
    .button:active {
        background: rgb(20, 20, 20);
    }
    .button:disabled {
        background: rgb(50, 50, 50);
        color: black;
    }
    .redirect {
        background: transparent;
        border: none;
        color: black;
        margin-top: 1em;
        font-size: 15px;
        text-decoration: underline;
        font-weight: bold;
        cursor: pointer;
    }
    .error_message {
        color: red;
        font-size: 15px;
    }
    .info_message {
        color: cornflowerblue;
        font-size: 15px;
    }
</style>
<body>
    <form method="post" action="${pageContext.request.contextPath}/login">
        <%
            ServletContext context = request.getServletContext();
            String message = (String) context.getAttribute("message");
            String error = (String) context.getAttribute("error");
            if (message != null) {
        %>
            <span class="info_message"><jsp:text>${message}</jsp:text></span>
        <%
            }
            if (error != null) {
        %>
            <span class="error_message"><jsp:text>${error}</jsp:text></span>
        <%
            }
            context.removeAttribute("message");
            context.removeAttribute("error");
        %>
        <span class="title">Login</span>
        <label>Username</label>
        <input type="text" name="username" id="username" placeholder="Enter username" class="input">
        <label>Password</label>
        <input type="password" name="password" id="password" placeholder="Enter password" class="input">
        <button type="submit" class="button">Next</button>
        <a href="${pageContext.request.contextPath}/register" class="redirect">Register</a>
    </form>
</body>
</html>