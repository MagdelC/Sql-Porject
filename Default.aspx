<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SQLInjectionTest._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SQL Injection Test</title>
    <style type="text/css">
        body {
            font-family: Calibri;
            background-color: aliceblue;
        }
        input[type="text"]  {
          display: inline-block;
          margin: 0;
          width: 200px;
          font-family: sans-serif;
          font-size: 15px;
          appearance: none;
          box-shadow: none;
          border-radius: none;
        }
        input[type="password"]
         {
          display: inline-block;
          margin: 0;
          width: 200px;
          font-family: sans-serif;
          font-size: 15px;
          appearance: none;
          box-shadow: none;
          border-radius: none;
        }
    </style>
</head>


<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>SQL Injection Test</h1>
        <hr />
        This page is deliberately compromised in order to allow a SQL injection attack.
        <br />
        The page will work normally assuming that there is a table named &#39;Users&#39; with some fields in it and at least one field called UserName in it.<br />
        <br />
        Enter the values in the fields below and click on &quot;Get Data&quot; to execute the function.<br />
        <br />
        To test SQL injection try add the following text into the filter field to return all table names in the selected DB:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zzzzzzz&#39; UNION Select name from sys.tables --<br />
        <br />
        The zzzzz&#39; is to eliminate any results from the users table and then we do a Union to execute our next quey.<br />
        Please note that the injected command must return the same number of columns as the original table for the query to work.<br />
        <hr />
        <h3>Please supply the values in order to test</h3>
        SQL Server:<br />
        <asp:TextBox ID="txtServer" runat="server"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtServer" Display="Dynamic" ErrorMessage="Cannot be blank!"></asp:RequiredFieldValidator>
        <br />
        Database:<br />
        <asp:TextBox ID="txtDB" runat="server"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDB" Display="Dynamic" ErrorMessage="Cannot be blank!"></asp:RequiredFieldValidator>
        <br />
        User Name:<br />
        <asp:TextBox ID="txtUser" runat="server"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUser" Display="Dynamic" ErrorMessage="Cannot be blank!"></asp:RequiredFieldValidator>
        <br />
        Password:<br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Cannot be blank!"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        Display Users from user table filtered by your criteria:<br />
        Username contains:
        <asp:TextBox ID="txtCompare" runat="server"  ></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Data" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    
    </div>
    </form>
</body>
</html>
