<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="WebAppCRUD.Admin.ViewProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h1 class="page-header">View Products</h1>
    <asp:GridView ID="ProductGridView" runat="server" 
        DataSourceID="ProductsDataSource"
        CssClass="table table-hover"
        AutoGenerateColumns="False"
        ItemType="WestWindSystem.Entities.Product">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName"></asp:BoundField>
            <asp:TemplateField HeaderText="Supplier">
                <ItemTemplate>
                    <asp:DropDownList ID="SuppliersDropDown"
                        runat="server" 
                        Enabled="false"
                        SelectedValue="<%# Item.SupplierID %>"
                        DataSourceID="SuppliersDataSource"
                        DataTextField="CompanyName"
                        DataValueField="SupplierID"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID"></asp:BoundField>
            <asp:BoundField DataField="QuantityPerUnit" HeaderText="QuantityPerUnit" SortExpression="QuantityPerUnit"></asp:BoundField>
            <asp:BoundField DataField="MinimumOrderQuantity" HeaderText="MinimumOrderQuantity" SortExpression="MinimumOrderQuantity"></asp:BoundField>
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice"></asp:BoundField>
            <asp:BoundField DataField="UnitsOnOrder" HeaderText="UnitsOnOrder" SortExpression="UnitsOnOrder"></asp:BoundField>
            <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued"></asp:CheckBoxField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource runat="server" ID="ProductsDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="ListProducts" TypeName="WestWindSystem.BLL.CRUDController"></asp:ObjectDataSource>

    <asp:ObjectDataSource runat="server" ID="SuppliersDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="ListSuppliers" TypeName="WestWindSystem.BLL.CRUDController"></asp:ObjectDataSource>

    <asp:ObjectDataSource runat="server" ID="CategoriesDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="ListCategories" TypeName="WestWindSystem.BLL.CRUDController"></asp:ObjectDataSource>
</asp:Content>
