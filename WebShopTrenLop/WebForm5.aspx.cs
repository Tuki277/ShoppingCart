using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShopTrenLop
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void updated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
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

        protected void updating(object sender, FormViewUpdateEventArgs e)
        {
            FileUpload f = (FileUpload)FormView1.FindControl("FileUpload1");
            String path = Server.MapPath("~/Images/");
            if (f.FileName != "")
            {
                f.PostedFile.SaveAs(path + f.FileName);
                SqlDataSource1.UpdateParameters["ImagePath"].DefaultValue = f.FileName;
            }
        }
    }
}