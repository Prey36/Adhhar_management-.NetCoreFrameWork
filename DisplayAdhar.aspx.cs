using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace Addhar_management
{
    public class JsonObject
    {
        [JsonPropertyName("self")]
        public string Self { get; set; }
    }
    public class JsonObject2
    {
        [JsonPropertyName("image_url")]
        public string ImageUrl { get; set; }
    }
    public partial class DisplayAdhar : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        string urlLink;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email_user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["Addhar"].ConnectionString;
                con.Open();
                showAdhar();
                showupdateadhar();
                con.Close();
            }
        }
        public void showAdhar()
        {
            string command = "Select * from NewAdhar where Email='" + Session["email_user"] + "'";
            SqlCommand cmd = new SqlCommand(command, con);
            SqlDataReader rdr = cmd.ExecuteReader();
            Newadhardisplay.DataSource = rdr;
            Newadhardisplay.DataBind();
            rdr.Close();
        }
        public void showupdateadhar()
        {
            string command = "Select * from Contact where email='" + Session["email_user"] + "'";
            SqlCommand cmd = new SqlCommand(command, con);
            SqlDataReader rdr = cmd.ExecuteReader();
            QueryDisplay.DataSource = rdr;
            QueryDisplay.DataBind();
            rdr.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected async void getAdharBtn_Click(object sender, EventArgs e)
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Addhar"].ConnectionString;
            con.Open();
            string command = "Select * from NewAdhar where id="+ adharcard_Input.Value;
            SqlCommand cmd = new SqlCommand(command, con);
            SqlDataReader rdr = await cmd.ExecuteReaderAsync();
            while(await rdr.ReadAsync())
            {
               
                using(var client = new HttpClient())
                {
                    client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", "bb_pr_c210ecb87a4c2de9944983401d3b5d");
                    var myJson = "{\r\n  \"template\": \"A37YJe5q1q4Y5mpvWK\",\r\n  \"modifications\": [\r\n    {\r\n      \"name\": \"name\",\r\n      \"text\": \" " + rdr["FullName"] + " \",\r\n      \"color\": null,\r\n      \"background\": null\r\n    },\r\n    {\r\n      \"name\": \"address\",\r\n      \"text\": \" " + rdr["homeaddress"] + " \",\r\n      \"color\": null,\r\n      \"background\": null\r\n    },\r\n    {\r\n      \"name\": \"adharcard_no\",\r\n      \"text\": \" " + rdr["id"] + " \",\r\n      \"color\": null,\r\n      \"background\": null\r\n    }\r\n  ],\r\n  \"webhook_url\": null,\r\n  \"transparent\": false,\r\n  \"metadata\": null\r\n}";
                    // Panel1.GroupingText = myJson;
                    var response = await client.PostAsync(
                        "https://api.bannerbear.com/v2/images",
                        new StringContent(myJson, Encoding.UTF8, "application/json")
                        );
                    // Panel1.GroupingText += response;
                    var res = await response.Content.ReadAsStringAsync(); //right!
                    JsonObject jsonObject = JsonSerializer.Deserialize<JsonObject>(res);
                    string link = jsonObject.Self;
                    
                    Panel1.GroupingText = link;
                    this.urlLink = link;
                }
                

            }
        }

        protected void onGetAdhar_Click(object sender, EventArgs e)
        {
            string link = "";
            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", "bb_pr_c210ecb87a4c2de9944983401d3b5d");
                 Panel1.GroupingText = urlLink;
                Image1.ImageUrl = "https://images.bannerbear.com/direct/9qK7GrM8x34Mbykp02/requests/000/042/992/461/OA0Ekvge5YdEkpXAzKqRLpWxX/71784cf7aef1c3bd1606d39c669cd06ce0655b6e.png";


            }
        }
    }
}