<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSuppliers.aspx.cs" Inherits="WebAppCRUD.Admin.ViewSuppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="SupplierRepeater" runat="server" DataSourceID="SupplierDataSource" ItemType="WestWindSystem.Entities.Supplier">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li><%# Item.CompanyName %></li>

        </ItemTemplate>
        <SeparatorTemplate></SeparatorTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>
        <asp:ObjectDataSource ID="SupplierDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectCountMethod="ListSuppliers" TypeName="WestWindSystem.BLL.CRUDController"></asp:ObjectDataSource>
</asp:Content>
