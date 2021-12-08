<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebShopTrenLop.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieude" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="300px" AutoGenerateRows="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Pid" DataSourceID="SqlDataSource1">
        <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <Fields>
            <asp:BoundField DataField="Pid" HeaderText="Pid" InsertVisible="False" ReadOnly="True" SortExpression="Pid" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
            <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
            <asp:BoundField DataField="MetaTitle" HeaderText="MetaTitle" SortExpression="MetaTitle" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <%--<asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />--%>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="ImagePath" runat="server" ImageUrl='<%# "~/Images/" + Eval("ImagePath") %>' Width="50"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ECartDB2ConnectionString %>" 
        SelectCommand="select P.Pid, P.ProdName, P.MetaTitle, P.Description, P.ImagePath, P.Price, C.CategoryName from Category C, Product P where P.Categoryid = C.Categoryid and P.Pid = @Pid">
        <SelectParameters>
            <asp:QueryStringParameter Name="Pid" Type="Int32" QueryStringField="Pid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
