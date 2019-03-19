<%@ Page Language="C#" MasterPageFile="~/Lab3.Master" AutoEventWireup="true" CodeBehind="controls.aspx.cs" Inherits="ICT713_Lab3_LoganFidler.Default" %>

<asp:Content ID="controls" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="container">
        <div class="grid-control">
            <asp:DropDownList ID="ddlTechnicians" runat="server" AutoPostBack="True" DataSourceID="TechnicianDataSource" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>
            <asp:ObjectDataSource ID="TechnicianDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTechnicians" TypeName="ICT713_Lab3_LoganFidler.App_Code.TechnicianDB"></asp:ObjectDataSource>
        </div>
        <div class="grid-control">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="IncidentDataSource" OnRowUpdated="GridView1_RowUpdated" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="IncidentID" HeaderText="ID" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="ProductCode" HeaderText="Product code" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="DateOpened" DataFormatString="{0:d}" HeaderText="Date opened" HtmlEncode="False" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="DateClosed" DataFormatString="{0:d}" HeaderText="Date closed" HtmlEncode="False" ApplyFormatInEditMode="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True">
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Description">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>' Rows="4" TextMode="MultiLine" Width="275px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle Width="285px" />
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" >
                        <ItemStyle VerticalAlign="Top" />
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:ObjectDataSource ID="IncidentDataSource" runat="server" ConflictDetection="CompareAllValues" DataObjectTypeName="ICT713_Lab3_LoganFidler.App_Code.Incident" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTechIncidents" TypeName="ICT713_Lab3_LoganFidler.App_Code.IncidentDB" UpdateMethod="UpdateIncident" OnUpdated="IncidentDataSource_Updated">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTechnicians" Name="TechID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="original_Incident" Type="Object" />
                    <asp:Parameter Name="incident" Type="Object" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </div>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>

