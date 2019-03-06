<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ICT713_Lab3_LoganFidler.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlTechnicians" runat="server" AutoPostBack="True" DataSourceID="TechnicianDataSource" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>
            <asp:ObjectDataSource ID="TechnicianDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTechnicians" TypeName="ICT713_Lab3_LoganFidler.App_Code.TechnicianDB"></asp:ObjectDataSource>
        </div>
        <asp:GridView ID="gvIncidents" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
