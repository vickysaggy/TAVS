<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false" Inherits="TAV._Default" Codebehind="Default.aspx.vb" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<style type="text/css" >
      .cFN
        {
        	font-family:Tahoma;
        	font-size:11px;
        	color:#000;
        	text-decoration:none;
        }
      .cFB
        {
        	font-family:Tahoma;
        	font-size:12px;
        	color: #000;
        	font-weight:bolder;
        	text-decoration:none;
        }
        .cFontN
        {
        	font-family:Tahoma;
        	font-size:11px;
        	color:#000;
        	text-decoration:none;
        }
      .cFontB
        {
        	font-family:Tahoma;
        	font-size:11px;
        	color: #fff;
        	font-weight:bolder;
        	text-decoration:none;
        }
        .cssPager span { color:red; font-size:16px; border-right-width:1px; border-right-color:#dddddd; font-weight:bolder;}   
         .cssPager td {padding-left: 3px; padding-right: 3px; border-right-color:#dddddd;}
         .cssPager a {text-decoration: none;}
  </style>
  
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
  
    <h2>INTEREST RATES OF BANKS AND FINANCIAL COMPANIES</h2>
    <br />   
    <table width="100%" cellpadding="3" cellspacing="0" border="0"> 
        <asp:Panel ID="PanelMessage" runat="server" Visible="false">
        <tr>
            <asp:Label ID="lblMessage" runat="server" Text="" style="font-family:Arial; font-size:12px; color:Red; font-weight:bold;"></asp:Label>
        </tr>  
        </asp:Panel>
        <asp:Panel ID="PanelQry" runat="server">
        
        <tr>
            <td width="40%" valign="top" style="background-color:#FFFACD;">
                <font class="cFB">Start Year &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Start Month </font><br />
                <asp:DropDownList ID="DDLYear" runat="server"  
                style="width:70px;height:24px;border-collapse:collapse;border-right:0;border-left:0;border-top:0;border-bottom:0;border:1px #cccccc solid;">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DDLMonth" runat="server"  
                style="width:80px;height:24px;border-collapse:collapse;border-right:0;border-left:0;border-top:0;border-bottom:0;border:1px #cccccc solid;">
                </asp:DropDownList><br /><br />
                <font class="cFB">End Year &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End Month </font><br />
                <asp:DropDownList ID="DDLEYear" runat="server"  
                style="width:70px;height:24px;border-collapse:collapse;border-right:0;border-left:0;border-top:0;border-bottom:0;border:1px #cccccc solid;">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DDLEMonth" runat="server"  
                style="width:80px;height:24px;border-collapse:collapse;border-right:0;border-left:0;border-top:0;border-bottom:0;border:1px #cccccc solid;">
                </asp:DropDownList><br /><br />
               <asp:Button ID="btnSubmit" runat="server" Text=" :: DISPLAY RESULTS :: "   style="font-weight:bold;font-family:Calibri;color:#fff;height:24px;background-color:#666666;border-collapse:collapse;border-right:0;border-left:0;border-top:0;border-bottom:0;border: 1px #4e667d solid;"/>
            </td>
            <td width="60%" style="background-color:#FFFACD;"><font class="cFB">Select Criteria to Display</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="cbSelectAll" Text="Select All" runat="server" AutoPostBack="true" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="cbClearAll" Text="Clear All" runat="server" AutoPostBack="true" /><br />
                <asp:CheckBoxList ID = "ChkCriteria" runat = "server" CssClass="cFN">
                    <asp:ListItem Text="Prime Lending Rate" Value="prime_lending_rate"></asp:ListItem>
                    <asp:ListItem Text="Bank Fixed Deposits 3 Months" Value="banks_fixed_deposits_3m"></asp:ListItem>
                    <asp:ListItem Text="Bank Fixed Deposits 6 Months" Value="banks_fixed_deposits_6m"></asp:ListItem>
                    <asp:ListItem Text="Bank Fixed Deposits 12 Months" Value="banks_fixed_deposits_12m"></asp:ListItem>
                    <asp:ListItem Text="Bank Savings Deposits" Value="banks_savings_deposits"></asp:ListItem>
                    <asp:ListItem Text="Finance Companies Loans - Hire Purchase of New Vehicles for 3 Years" Value="fc_hire_purchase_motor_3y"></asp:ListItem>
                    <asp:ListItem Text="Finance Companies Housing Loans for 15 Years" Value="fc_housing_loans_15y"></asp:ListItem>
                    <asp:ListItem Text="Finance Companies Fixed Deposits 3 Months" Value="fc_fixed_deposits_3m"></asp:ListItem>
                    <asp:ListItem Text="Finance Companies Fixed Deposits 6 Months" Value="fc_fixed_deposits_6m"></asp:ListItem>
                    <asp:ListItem Text="Finance Companies Fixed Deposits 12 Months" Value="fc_fixed_deposits_12m"></asp:ListItem>
                    <asp:ListItem Text="Finance Companies Savings Deposits" Value="fc_savings_deposits"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        </asp:Panel>
       
       <asp:Panel ID="PanelResult" runat="server">
        <tr>
            <td colspan="2" align="left"><asp:HyperLink ID="hlNQ" runat="server" ToolTip="click to make another query" NavigateUrl="~/Default.aspx" >&lt;&lt;&nbsp;New Query</asp:HyperLink></td>
        </tr>
        
        <tr >
            <td colspan="2" width="90%" align="left">
                PERCENT PER ANNUM<br />
                 <asp:GridView ID="gvReportTA" runat="server" 
                        AllowPaging="true"
                        AllowSorting="true"
                        AlternatingRowStyle-BackColor="#eeeeee"
                        AutoGenerateColumns="false"
                        BackColor="#ffffff" 
                        BorderColor="#bbbbbb" 
                        BorderStyle="Solid" 
                        BorderWidth="1px" 
                        CellPadding="1" 
                        CellSpacing="0" 
                        CssClass ="cssPager" 
                        DataKeyNames="end_of_month" 
                        FooterStyle-BackColor="#666666"
                        FooterStyle-ForeColor="#ffffff" 
                        HorizontalAlign="center"
                        PagerStyle-BackColor="#f3e8ff"
                        PagerStyle-BorderColor="ActiveBorder"
                        PagerStyle-Font-Underline= "false"  
                        PagerStyle-Wrap="true"
                        PageSize="2000"
                        RowStyle-BackColor="#ffffff" 
                        RowStyle-ForeColor="#000000" 
                        RowStyle-BorderColor="#dddddd"
                        RowStyle-BorderWidth="1"
                        RowStyle-BorderStyle="Outset" 
                        HeaderStyle-Height="45"
                        HeaderStyle-Wrap="true"
                        RowStyle-Height="15" 
                        SelectedRowStyle-BackColor="#f3e8ff"
                        ShowFooter="True" >
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate><font class="cFontB" color="white">SNo</font></HeaderTemplate>
                            <ItemTemplate>
                                <center><asp:Label ID="lblSRNo" runat="server" Text="<%#Container.DataItemIndex+1 %>" style="font-family:Tahoma, Arial;font-size:11px; font-weight:normal; color:Black;" ></asp:Label></center>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="end_of_month" SortExpression="end_of_month" ItemStyle-Width="90" HeaderText="End of Period" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterText="" FooterStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="prime_lending_rate" SortExpression="prime_lending_rate" ItemStyle-Width="75" HeaderText="Prime Lnding Rate" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="banks_fixed_deposits_3m" SortExpression="banks_fixed_deposits_3m" ItemStyle-Width="75" HeaderText="Banks Fixed Deposits 3 Months" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="banks_fixed_deposits_6m" SortExpression="banks_fixed_deposits_6m" ItemStyle-Width="75" HeaderText="Banks Fixed Deposits 6 Months" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="banks_fixed_deposits_12m" SortExpression="banks_fixed_deposits_12m" ItemStyle-Width="75" HeaderText="Banks Fixed Deposits 12 Months" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="banks_savings_deposits" SortExpression="banks_savings_deposits" ItemStyle-Width="75" HeaderText="Banks Savings Deposits" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="fc_hire_purchase_motor_3y" SortExpression="fc_hire_purchase_motor_3y" ItemStyle-Width="75" HeaderText="Finance Companies Loans - Hire Purchase of New Vehicles For 3 Years" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="fc_housing_loans_15y" SortExpression="fc_housing_loans_15y" ItemStyle-Width="75" HeaderText="Finance Companies Housing Loans For 15 Years" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="fc_fixed_deposits_3m" SortExpression="fc_fixed_deposits_3m" ItemStyle-Width="75" HeaderText="Finance Companies Fixed Deposits 3 Months" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="fc_fixed_deposits_6m" SortExpression="fc_fixed_deposits_6m" ItemStyle-Width="75" HeaderText="Finance Companies Fixed Deposits 6 Months" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="fc_fixed_deposits_12m" SortExpression="fc_fixed_deposits_12m" ItemStyle-Width="75" HeaderText="Finance Companies Fixed Deposits 12 Months" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        <asp:BoundField DataField="fc_savings_deposits" SortExpression="fc_savings_deposits" ItemStyle-Width="75" HeaderText="Finance Companies Savings Deposits" InsertVisible="False" ReadOnly="True" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" HeaderStyle-VerticalAlign="Middle"
                                            HeaderStyle-CssClass="cFontB" FooterStyle-Height="22" ItemStyle-CssClass="cFontN" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="White" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="false"/>
                        
                        
                    </Columns>
                    <PagerStyle ForeColor="#9966ff" HorizontalAlign="Center"  />
                    <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="#ffffff" />
                </asp:GridView>
            </td>
        </tr>
        </asp:Panel>
   </table>
        
</asp:Content>