using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ICT713_Lab3_LoganFidler.App_Code
{
    [DataObject(true)]
    public static class IncidentDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetTechIncidents(int TechID)
        {
            string query = "SELECT IncidentID, DateOpened, "
                + "Title, Description, CustomerID, ProductCode, DateClosed "
                + "FROM Incidents WHERE TechID = @TechID "
                + "ORDER BY DateOpened";
            SqlConnection connection = new SqlConnection(TechSupportDB.GetConnectionString());
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("TechID", TechID);
            connection.Open();
            SqlDataReader dataReader = command.ExecuteReader();
            return dataReader;
        }

        
        [DataObjectMethod(DataObjectMethodType.Update)]
        public static int UpdateIncident(Incident original_Incident, Incident incident)
        {
            int updateRow = 0;
            string query = "UPDATE Incidents "
                + "SET DateClosed = @DateClosed, "
                + "Description = @Description "
                + "WHERE IncidentID = @original_IncidentID "
                + "AND DateClosed = @original_DateClosed "
                + "AND Description = @original_Description";
            using (SqlConnection connection = new SqlConnection(TechSupportDB.GetConnectionString()))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if(incident.DateClosed == Convert.ToDateTime("01/01/0001 12:00:00 AM"))
                    {
                        command.Parameters.AddWithValue("DateClosed", DBNull.Value);
                    }
                    else
                    {
                        command.Parameters.AddWithValue("DateClosed", incident.DateClosed);
                    }
                    command.Parameters.AddWithValue("Description", incident.Description);
                    command.Parameters.AddWithValue("original_IncidentID", original_Incident.IncidentID);
                    command.Parameters.AddWithValue("original_DateClosed", original_Incident.DateClosed);
                    command.Parameters.AddWithValue("original_description", original_Incident.Description);
                    connection.Open();
                    updateRow = command.ExecuteNonQuery();
                }
            }
            return updateRow;
        }
    }
}