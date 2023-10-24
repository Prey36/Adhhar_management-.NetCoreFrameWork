<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgetpassword.aspx.cs" Inherits="Addhar_management.Forgetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
</head>
<body>
    <h1>Forgot Password</h1>
    <form method="post" action="ForgetPassword.aspx">
        <label for="email">Email:</label>
        <input type="email" name="email" required />
        <button type="submit">Submit</button>
    </form>
</body>
</html>
