<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebShopTrenLop.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieude" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Pid" DataSourceID="SqlDataSource1">
            <Columns>
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

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:HyperLinkField DataNavigateUrlFields="Pid"
                    DataNavigateUrlFormatString="WebForm3.aspx?Pid={0}"
                    Text="Detail"
                    HeaderText="Detail"
                 />

                <asp:HyperLinkField DataNavigateUrlFields="Pid"
                    DataNavigateUrlFormatString="WebForm5.aspx?Pid={0}"
                    Text="Edit"
                    HeaderText="Edit"
                 />

                <asp:TemplateField>
                    <ItemTemplate>
                        <a  href='WebForm6.aspx?pid=<%#  Eval("Pid")  %>&name=<%#  Eval("ProdName")  %>&image=<%# Eval("ImagePath")  %>&price=<%#  Eval("Price")  %>&action=add'  class="button">Mua  hàng</a>
                    </ItemTemplate>
                </asp:TemplateField>
                

            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource 
            ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ECartDB2ConnectionString %>" 
            DeleteCommand="DELETE FROM [Product] WHERE [Pid] = @Pid" 
            InsertCommand="INSERT INTO [Product] ([Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (@Categoryid, @ProdName, @MetaTitle, @Description, @ImagePath, @Price)" 
            SelectCommand="select P.Pid, P.ProdName, P.MetaTitle, P.Description, P.ImagePath, P.Price, C.CategoryName from Category C, Product P where P.Categoryid = C.Categoryid" 
            UpdateCommand="UPDATE [Product] SET [Categoryid] = @Categoryid, [ProdName] = @ProdName, [MetaTitle] = @MetaTitle, [Description] = @Description, [ImagePath] = @ImagePath, [Price] = @Price WHERE [Pid] = @Pid">
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
