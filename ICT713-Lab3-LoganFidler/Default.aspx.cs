using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICT713_Lab3_LoganFidler
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void IncidentDataSource_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            e.AffectedRows = Convert.ToInt32(e.ReturnValue);
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }

        private string DatabaseErrorMessage(Exception ex)
        {
            string msg = $"<b>A database issue has occurred:</b> {ex.Message}";
            if (ex.InnerException != null)
                msg += $"<br />Message: {ex.InnerException.Message}";
            return msg;
        }

        private string ConcurrencyErrorMessage()
        {
            return "Potential concurrency issue detected. Another user may have updated that cell.";
        }
    }
}