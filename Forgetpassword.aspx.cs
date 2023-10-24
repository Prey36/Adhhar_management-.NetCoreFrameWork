using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Addhar_management
{
    public partial class Forgetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string email = Request.Form["email"];
                string resetToken = Guid.NewGuid().ToString(); // Generate a unique token

                // Store the reset token and expiration time in the database for the user with the provided email
                using (SqlConnection connection = new SqlConnection("Addhar"))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Registration SET ResetToken = @ResetToken, TokenExpiration = DATEADD(HOUR, 1, GETDATE()) WHERE Email = @Email", connection);
                    cmd.Parameters.AddWithValue("@ResetToken", resetToken);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.ExecuteNonQuery();
                }

                // Send a password reset email to the user
                SendPasswordResetEmail(email, resetToken);
            }
        }
        private void SendPasswordResetEmail(string toEmail, string resetToken)
        {
            // Set up your email configuration (SMTP server, credentials, etc.)
            SmtpClient smtpClient = new SmtpClient("YourSmtpServer");
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("YourEmail", "YourPassword"); // Replace with your email credentials
            smtpClient.EnableSsl = true;

            // Create the email message
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("YourEmail"); // Replace with your email address
            mailMessage.To.Add(toEmail);
            mailMessage.Subject = "Password Reset Request";
            mailMessage.Body = $"Click the following link to reset your password: https://example.com/ResetPassword.aspx?token={resetToken}";

            try
            {
                // Send the email
                smtpClient.Send(mailMessage);
                // Email sent successfully
            }
            catch (Exception ex)
            {
                // Handle any exceptions, e.g., log the error
                // Failed to send the email
            }
        }
    }
}