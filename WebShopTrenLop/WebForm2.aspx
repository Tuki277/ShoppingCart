<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebShopTrenLop.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieude" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Pid" DataSourceID="SqlDataSource1" style="margin-left: 0px; margin-right: 4px; float: left" Width="495px">
        <ItemTemplate>
            <style>
                tr {
                    float: left;
                }
            </style>
            <div style="float: left; width: 100px">
                Pid:
                <asp:Label ID="PidLabel" runat="server" Text='<%# Eval("Pid") %>' />
                <br />
                Categoryid:
                <asp:Label ID="CategoryidLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
                <br />
                ProdName:
                <asp:Label ID="ProdNameLabel" runat="server" Text='<%# Eval("ProdName") %>' />
                <br />
                MetaTitle:
                <asp:Label ID="MetaTitleLabel" runat="server" Text='<%# Eval("MetaTitle") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                <br />
                ImagePath:
                <%--<asp:Label ID="ImagePathLabel" runat="server" Text='<%# Eval("ImagePath") %>' />--%>
                <asp:Image ID="ImagePath" runat="server" ImageUrl='<%# "~/Images/" + Eval("ImagePath") %>' Width="50"/>
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                <br />
                <br />
            </div>
            
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource 
        ID="SqlDataSource1" 
        runat="server" ConnectionString="<%$ ConnectionStrings:ECartDB2ConnectionString %>" 
        DeleteCommand="DELETE FROM [Product] WHERE [Pid] = @Pid" 
        InsertCommand="INSERT INTO [Product] ([Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (@Categoryid, @ProdName, @MetaTitle, @Description, @ImagePath, @Price)" 
        SelectCommand="select P.Pid, P.ProdName, P.MetaTitle, P.Description, P.ImagePath, P.Price, C.CategoryName from Category C, Product P where P.Categoryid = C.Categoryid and C.Categoryid = @Categoryid" 
        UpdateCommand="UPDATE [Product] SET [Categoryid] = @Categoryid, [ProdName] = @ProdName, [MetaTitle] = @MetaTitle, [Description] = @Description, [ImagePath] = @ImagePath, [Price] = @Price WHERE [Pid] = @Pid">
        <SelectParameters>
            <asp:QueryStringParameter Name="Categoryid" Type="Int32" QueryStringField="Categoryid" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Pid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Categoryid" Type="Int32" />
            <asp:Parameter Name="ProdName" Type="String" />
            <asp:Parameter Name="MetaTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Categoryid" Type="Int32" />
            <asp:Parameter Name="ProdName" Type="String" />
            <asp:Parameter Name="MetaTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Pid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
