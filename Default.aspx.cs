using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

namespace SQLInjectionTest
{
    public partial class _Default : System.Web.UI.Page
    {
        private string password = string.Empty;
        private string error = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            txtPassword.Attributes.Add("value", txtPassword.Text);
            if (error != string.Empty)
            {
                lblError.Text = error;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            password = txtPassword.Text;
            
            SqlConnectionStringBuilder connstring = new SqlConnectionStringBuilder();
            connstring.UserID = txtUser.Text;
            connstring.Password = txtPassword.Text;
            connstring.ApplicationName = "Vulnerable SQL App";
            connstring.ConnectTimeout = 30;
            connstring.DataSource = txtServer.Text;
            connstring.InitialCatalog = txtDB.Text;

            DataSet dataset = new DataSet();
            try
            {
                using (SqlConnection sqlconn = new SqlConnection(connstring.ConnectionString))
                {
                    sqlconn.Open();
                    using (SqlCommand sqlcom = sqlconn.CreateCommand())
                    {
                        sqlcom.CommandText = "Select * from Users Where UserName like '%@ip%'";
                        sqlcom.Parameters.Clear();
                        sqlcom.Parameters.AddWithValue("@ip", txtCompare.Text);
                        SqlDataAdapter da = new SqlDataAdapter(sqlcom);
                        da.Fill(dataset);
                    }
                }
                if (dataset.Tables.Count > 0)
                {
                    DataTable dt = dataset.Tables[0];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                lblError.Text = ex.Message;
            }
           
        }
    }
}