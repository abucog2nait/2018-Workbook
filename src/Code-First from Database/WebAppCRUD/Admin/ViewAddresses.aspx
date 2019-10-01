﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAddresses.aspx.cs" Inherits="WebAppCRUD.Admin.ViewAddresses" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h1>Addresses</h1>
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" /> 
    <%-- From user controls > drag it in here --%>
    <asp:ListView ID="AddressListView" runat="server" DataSourceID="AddressDataSource" DataKetNames="AddressID" InsertItemPosition="LastItem">
        <%-- DONT FORGET DATAKEYNAMES --%>
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CssClass="btn btn-danger"/> 
                    <%-- Make sure you edit the buttons --%>
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-default"/>
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Address1") %>' runat="server" ID="Address1Label" /></td>
                <td>
                    <asp:Label Text='<%# Eval("City") %>' runat="server" ID="CityLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Region") %>' runat="server" ID="RegionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PostalCode") %>' runat="server" ID="PostalCodeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Country") %>' runat="server" ID="CountryLabel" /></td>
                <td>
                   
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("Address1") %>' runat="server" ID="Address1TextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("City") %>' runat="server" ID="CityTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Region") %>' runat="server" ID="RegionTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("PostalCode") %>' runat="server" ID="PostalCodeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Country") %>' runat="server" ID="CountryTextBox" /></td>
                <td>   
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" CssClass="btn btn-success"/>
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" CssClass="btn btn-warning"/>
                </td>
               
                <td>
                    <asp:TextBox Text='<%# Bind("Address1") %>' runat="server" ID="Address1TextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("City") %>' runat="server" ID="CityTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Region") %>' runat="server" ID="RegionTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("PostalCode") %>' runat="server" ID="PostalCodeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Country") %>' runat="server" ID="CountryTextBox" /></td>
                <td>
                    
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CssClass="btn btn-danger" 
                        OnClientClick="return confirm('Are you sure you want to delete this address?')"/>
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-default"/>
                </td>
               
                <td>
                    <asp:Label Text='<%# Eval("Address1") %>' runat="server" ID="Address1Label" /></td>
                <td>
                    <asp:Label Text='<%# Eval("City") %>' runat="server" ID="CityLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Region") %>' runat="server" ID="RegionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PostalCode") %>' runat="server" ID="PostalCodeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Country") %>' runat="server" ID="CountryLabel" /></td>
                <td>
                    
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover table-condensed">  <%-- Make sure you design your tables --%>
                            <tr runat="server" style="">
                                <th runat="server"></th>
                               
                                <th runat="server">Street Address</th>
                                <th runat="server">City</th>
                                <th runat="server">Region</th>
                                <th runat="server">Postal Code</th>
                                <th runat="server">Country</th>

                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager runat="server" ID="DataPager1" PageSize="8">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
               
                <td>
                    <asp:Label Text='<%# Eval("Address1") %>' runat="server" ID="Address1Label" /></td>
                <td>
                    <asp:Label Text='<%# Eval("City") %>' runat="server" ID="CityLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Region") %>' runat="server" ID="RegionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PostalCode") %>' runat="server" ID="PostalCodeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Country") %>' runat="server" ID="CountryLabel" /></td>
                <td>
                    
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="AddressDataSource" runat="server" 
        DataObjectTypeName="WestWindSystem.Entities.Address"
        DeleteMethod="DeleteAddress" 
        InsertMethod="AddAddress"
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="ListAddresses" TypeName="WestWindSystem.BLL.CRUDController" 
        UpdateMethod="UpdateAddress"
        OnInserted="CheckForException" 
        OnDeleted="CheckForException" 
        OnUpdated="CheckForException"></asp:ObjectDataSource>
    <%-- On___  makes the method in asp.cs class--%>
</asp:Content>
