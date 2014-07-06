﻿<%@ Page language="c#" AutoEventWireup="true" 
	Inherits="GA.SC.UI.Layouts.AlgoMaster" 
	CodeBehind="AlgoMaster.aspx.cs" %>
<%@ Register TagPrefix="sc" Namespace="Sitecore.Web.UI.WebControls" Assembly="Sitecore.Kernel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">                  
<head>
	<title></title>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
	<style>
		* { font-family: 'Open Sans', sans-serif; font-size:12px; color:#444; }
		body { margin:0px; padding:0px; }
		h1 { font-size:17px; }
		a { color: #3366FF; }
		a:hover { text-decoration:underline; }
		.AlgoContent { padding:10px; }
		.main { width:1000px; margin:0px auto; }
			.header { }
				.logo { margin:10px 0px; display: inline-block; vertical-align:middle; }
					.logo a { font-size:28px; font-weight:bold; text-decoration: none; color:#000;  }
						.logo a:hover { text-decoration: none; color: #3366FF; }
				.headcontent { display: inline-block; vertical-align:middle; left: 206px; position: relative; width: 600px } 
					.headcontent .AlgoContent { height:20px; }
				.nav { border-color: #ccc; border-style: solid; border-width: 1px 0; padding: 5px 0; }
					.nav ul { margin:0px; padding:0px; }
					.nav li { display:inline-block; }
					.nav a { display:block; margin:0 4px; padding:3px 5px; border-radius:4px; text-decoration:none;}
					.nav a:hover { color:#fff; background-color:#3366FF; }
			.content { }
			.left, .center, .right { display:inline-block; vertical-align:top; min-height:500px; padding:10px; }	
			.left { width:220px; }
			.center { width:430px; border-left:1px solid #ccc; border-right:1px solid #ccc; }
			.right { width:280px; }
				.left .AlgoContent,
				.right .AlgoContent { height:100px; margin-bottom:10px; }
				.center .AlgoContent { height:100px; }
	</style>
</head>
<body>
	<form method="post" runat="server" id="mainform">
		<div class="main">
			<div class="header">
				<div class="logo"><asp:HyperLink ID="lnkLogo" Text="Algo Testsite" runat="server"></asp:HyperLink></div>
				<div class="headcontent">
					<sc:Placeholder Key="headcontent" runat="server"></sc:Placeholder>
				</div>
				<div class="nav">
					<asp:Repeater ID="rptNav" runat="server">
						<HeaderTemplate><ul></HeaderTemplate>
						<ItemTemplate>
							<li><a href="<%# ((KeyValuePair<string, string>)Container.DataItem).Key %>"><%# ((KeyValuePair<string, string>)Container.DataItem).Value %></a></li>
						</ItemTemplate>
						<FooterTemplate></ul></FooterTemplate>
					</asp:Repeater>
				</div>
			</div>
			<div class="content">
				<div class="left">
					<sc:Placeholder Key="leftcontent1" runat="server"></sc:Placeholder>
					<sc:Placeholder Key="leftcontent2" runat="server"></sc:Placeholder>
					<sc:Placeholder Key="leftcontent3" runat="server"></sc:Placeholder>
				</div>
				<div class="center">
					<sc:Placeholder Key="main" runat="server"></sc:Placeholder>
					<sc:Placeholder Key="centercontent" runat="server"></sc:Placeholder>
				</div>
				<div class="right">
					<sc:Placeholder Key="rightcontent1" runat="server"></sc:Placeholder>
					<sc:Placeholder Key="rightcontent2" runat="server"></sc:Placeholder>
					<sc:Placeholder Key="rightcontent3" runat="server"></sc:Placeholder>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
