﻿<%@ Page language="c#" AutoEventWireup="true" 
	Inherits="GA.SC.UI.SampleSite.Layouts.GAMaster" 
	CodeBehind="GAMaster.aspx.cs" %>
<%@ Register TagPrefix="sc" Namespace="Sitecore.Web.UI.WebControls" Assembly="Sitecore.Kernel" %>
<%@ Import Namespace="GA.Nucleus.Population" %>
<%@ Import Namespace="GA.SC.EV" %>
<%@ Import Namespace="GA.SC" %>


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
		.GAContent { text-align:center; border:1px solid #ccc; padding:5px; }
	        .GAContent a { font-weight:bold; font-size:44px; color:#fff; text-decoration:none; display:block; height:100%; }
		.main { width:1000px; margin:0px auto; }
			.header { }
				.logo { margin:10px 0px; display: inline-block; vertical-align:middle; }
					.logo a { font-size:28px; font-weight:bold; text-decoration: none; color:#000;  }
						.logo a:hover { text-decoration: none; color: #3366FF; }
				.headcontent { display: inline-block; vertical-align:middle; left: 228px; position: relative; width: 600px } 
					.headcontent .GAContent { height:40px; }
	                    .headcontent .GAContent a { font-size:16px; } 
				.nav { border-color: #ccc; border-style: solid; border-width: 1px 0; padding: 5px 0; }
					.nav ul { margin:0px; padding:0px; }
					.nav li { display:inline-block; }
					.nav a { display:block; margin:0 4px; padding:3px 5px; border-radius:4px; text-decoration:none; font-size:14px; }
					.nav a:hover { color:#fff; background-color:#3366FF; }
			.content { }
			.left, .center, .right { display:inline-block; vertical-align:top; min-height:500px; padding:10px; }	
			.left { width:220px; }
			.center { width:430px; border-left:1px solid #ccc; border-right:1px solid #ccc; }
			.right { width:280px; }
				.left .GAContent,
				.right .GAContent { height:120px; margin-bottom:25px; }
				.center .GAContent { height:120px; }
		.infoBox { position:absolute; top:0px; left:50px; }
			.infoBox .tab { position:absolute; bottom:-38px; top:-6px; cursor:pointer; height:19px; background:#fff; box-shadow:4px 3px 4px -2px #777; font-weight:bold; padding:16px 10px 10px; width:70px; border-radius:0px 0px 10px 0px; border:1px solid #777; border-top:0px; }
			.infoBox .monitor { display: none; padding:0px 20px 10px; border:1px solid #ccc; border-radius:0 0 10px 10px; margin:0px 0 0 6px; border-top:0px; background:#eee; box-shadow:4px 3px 4px -2px #777; }
		.col1, .col2 { display: inline-block; vertical-align:top; }
		.col1 { width: 200px; padding-top:35px; }
		.col2 { width: 650px; }
		.PopOptions { margin-bottom:10px; } 
				.PopOptions label { display:inline-block; width:125px; text-align:right; margin-right:5px;}
		.DNAList { font-size: 12px; margin:5px auto; height:373px; overflow:auto; border:1px solid #bbb; }
			.count { display:inline-block; width:9%; }
			.dna { display:inline-block; width:74%; text-align:center; }
			.fitness { display:inline-block; width:15%; text-align:right;}
		.EV { display:inline-block; width:155px; }
			.EV .tags { height:108px; overflow:auto; border:1px solid #ccc; margin-bottom:10px; }
			.EV .entry { text-align:left; }
			.EV .key { display:inline-block; width:75px; text-align:right; text-transform:uppercase; }
			.EV .value { display:inline-block; font-weight:bold; }
		.odd,
		.even { padding:4px 5px; #ccc; border-right:1px solid #ccc; }
		.odd { }
		.even { background:#fff; }
	</style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
    <script>
		var contextSite = <asp:Literal ID="ltlContextSite" runat="server"/>;
        var $j = jQuery.noConflict();
        $j(document).ready(function () {
            $j(".GAContent a, .nav a").click(function (e) {
                e.preventDefault();
                var tagName = $j(this).attr("tag");
                var href = $j(this).attr("href");
                $j.ajax({
                    type: "POST",
                    url: "/sitecore modules/Web/GA/WebService/EventTracking.asmx/TrackEvent",
                    data: "{ 'TagClick':'" + tagName + "', 'Site':'" + contextSite + "'}",
                    contentType: "application/json",
                    dataType: "json",
                    success: function (data, status) {
                        window.location.href = href;
                    },
                    error: function (e) { }
                });
            });
            $j(".infoBox .tab").click(function(e){
            	$j(".infoBox .monitor").toggle();
            });
        });
    </script>
</head>
<body>
	<form method="post" runat="server" id="mainform">
		<div class="main">
			<div class="header">
				<div class="logo"><asp:HyperLink ID="lnkLogo" Text="GA Testsite" runat="server"></asp:HyperLink></div>
				<div class="headcontent">
					<sc:Placeholder Key="headcontent" runat="server"></sc:Placeholder>
				</div>
				<div class="nav">
					<asp:Repeater ID="rptNav" runat="server">
						<HeaderTemplate><ul></HeaderTemplate>
						<ItemTemplate>
							<li><a tag="<%# ((KeyValuePair<string, string>)Container.DataItem).Value %>" href="<%# ((KeyValuePair<string, string>)Container.DataItem).Key %>"><%# ((KeyValuePair<string, string>)Container.DataItem).Value %></a></li>
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
		<div class="infoBox">
			<div class="monitor">
				<div class="col1">
					<h3>Population Numbers</h3>
					<div class="PopOptions">	
						<div class="formRow">
							<label title="the probability you'll mate (and possibly mutate) instead of just mutating.">Crossover Ratio (?) : </label>
							<asp:Literal ID="ltlCrossover" runat="server"></asp:Literal>
						</div>	
						<div class="formRow">
							<label title="the percentage of the population that doesn't change each generation.">Elitism Ratio (?) : </label>
							<asp:Literal ID="ltlElitism" runat="server"></asp:Literal>
						</div>
						<div class="formRow">
							<label title="the percentage of the highest fitness value that's acceptable in another karyotype as a candidate for selection.">Fitness Ratio (?) : </label>
							<asp:Literal ID="ltlFitness" runat="server"></asp:Literal>
						</div>
						<div class="formRow">
							<label title="if the list is ascending or descending">Fitness Sorting (?) : </label>
							<asp:Literal ID="ltlFitSort" runat="server"></asp:Literal>
						</div>
						<div class="formRow">
							<label title="the fitness value required for the algorithm to begin selecting based on the fittest karyotypes instead of randomly selecting a karyotype.">Fitness Threshold (?) : </label>
							<asp:Literal ID="ltlThreshold" runat="server"></asp:Literal>
						</div>
						<div class="formRow">
							<label title="probability that a karyotype will mutate.">Mutation Ratio (?) : </label>
							<asp:Literal ID="ltlMutation" runat="server"></asp:Literal>
						</div>
						<div class="formRow">
							<label title="number of times to try to randomly find a better parent from the one randomly selected.">Tournament Size (?) : </label>
							<asp:Literal ID="ltlTourney" runat="server"></asp:Literal>
						</div>
						<div class="formRow">
							<label title="number of karyotypes to create in your population.">Population Size (?) : </label>
							<asp:Literal ID="ltlPopSize" runat="server"></asp:Literal>
						</div>
					</div>
					<h3>Population Status</h3>
					<div class="PopStatus">
						<label>Karyotype Count is:</label> 
						<span>
							<asp:Literal ID="ltlKaryos" runat="server"></asp:Literal>
						</span>
						<br/>
						<label>Unique Karyotypes:</label> 
						<span>
							<asp:Literal ID="ltlUKaryos" runat="server"></asp:Literal>
						</span>
						<br/>
					</div>
					<h3>Click Values</h3>
					<div class="EV">
						<div class="tags">
							<asp:Repeater ID="rptEV" runat="server">
								<ItemTemplate>
									<div class="entry <%# OddEven(Container.ItemIndex) %>">
										<div class="key">
											<%# ((KeyValuePair<string, List<IEngagementValue>>)Container.DataItem).Key %> : 
										</div>
										<div class="value">
											<%# ((KeyValuePair<string, List<IEngagementValue>>)Container.DataItem).Value.Sum(a => a.Value) %>
										</div>
									</div>
								</ItemTemplate>
							</asp:Repeater>
						</div>
					</div>
				</div>
				<div class="col2">
					<h3>Population Makeup</h3>
					<div class="Controls">
						<div class="CurKaryo">
							<asp:Literal ID="ltlKaryotype" runat="server" />
						</div>
						<div class="DNAList">
							<asp:Repeater ID="rptDNAList" runat="server">
								<ItemTemplate>
									<div class="<%# OddEven(Container.ItemIndex) %>">
										<div class="count"><%# Container.ItemIndex + 1 %>:</div> 
										<div class="dna"><%# ((IKaryotype)Container.DataItem).Phenotype.DNASequence() %></div>
										<div class="fitness"><%# ((IKaryotype)Container.DataItem).Fitness %></div>
									</div>
								</ItemTemplate>
							</asp:Repeater>
						</div>
					</div>
				</div>
			</div>
			<div class="tab">
				GA Monitor
			</div>
		</div>
	</form>
</body>
</html>
