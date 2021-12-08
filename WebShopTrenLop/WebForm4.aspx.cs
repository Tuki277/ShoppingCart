using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShopTrenLop
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void inserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload f = (FileUpload)FormView1.FindControl("FileUpload1");
            String path = Server.MapPath("~/Images/");
            f.PostedFile.SaveAs(path + f.FileName);
            SqlDataSource1.InsertParameters["ImagePath"].DefaultValue = f.FileName;
        }

        protected void inserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
                errMsg.ForeColor = System.Drawing.Color.Red;
                errMsg.Text = "Có lỗi xảy ra: " + e.Exception.Message;
            }
            else
            {
                errMsg.ForeColor = System.Drawing.Color.Blue;
                errMsg.Text = "OK";
            }
        }
    }
}