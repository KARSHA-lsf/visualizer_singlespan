<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Visualizer - Karsha project</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">
<link href="css/plugins/morris.css" rel="stylesheet">
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="css/jquery-ui.css" rel="stylesheet">
<script src="js/jquery.1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/function.js"></script>
<script src="js/node.js"></script>
<script src="js/app.js"></script>
<script src="js/tracepaths.js"></script>
<script type="text/javascript">
$(function() {
  $( "#accordion" ).accordion();
});
</script>

<style type="text/css">
.demoHeaders {
	margin-top: 2em;
}

#dialog-link {
	padding: .4em 1em .4em 20px;
	text-decoration: none;
	position: relative;
}

#dialog-link span.ui-icon {
	margin: 0 5px 0 0;
	position: absolute;
	left: .2em;
	top: 50%;
	margin-top: -8px;
}

#icons {
	margin: 0;
	padding: 0;
}

#icons li {
	margin: 2px;
	position: relative;
	padding: 4px 0;
	cursor: pointer;
	float: left;
	list-style: none;
}

#icons span.ui-icon {
	float: left;
	margin: 0 4px;
}

.fakewindowcontain .ui-widget-overlay {
	position: absolute;
}

select {
	width: 300px;
}
</style>
</head>


<body style="background-color: white">
	<div id="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Visualizer - Karsha
				project</a>
		</div>
		
		 <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li><a href="index.jsp"><i
                                    class="fa fa-fw fa-dashboard"></i> Karsha Visualizer</a>
                            <ul id="accordion">
                                
                                <li>
                                    <h3><a href="#">Network Visualization</a></h3>
                                    <ul>
                                        <li><a href="net_view.jsp?filename=daily.json&type=Daily"><i class="fa fa-fw fa-table"></i> Daily </a></li>
                                        <li><a href="net_view.jsp?filename=weekly.json&type=Weekly"><i class="fa fa-fw fa-table"></i> Weekly </a></li>
                                   </ul>
                                </li>
                               
                            </ul>               

                        </li>
                        <li><a href="DataAnalysis.jsp"><!-- <i class="fa fa-fw fa-table"></i> -->
                               Network Summary Statistics</a></li>
                        <li><a href=""><i class="fa fa-fw fa-file"></i>
                                More About</a></li>

                    </ul>
                 </div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- <div class="collapse navbar-collapse navbar-ex1-collapse">
			 <ul class="nav navbar-nav side-nav">
                        <li class="active"><a href="index.jsp"><i class="fa fa-fw fa-dashboard"></i> Karsha Visualizer</a></li>
                        <ul id="accordion">
                        <li>
                           <h3><a href="net_view.jsp?filename=daily.json&type=Daily">Network Visualization</a></h3>
                              <ul>
                                 <li><a href="net_view.jsp?filename=daily.json&type=Daily"><i class="fa fa-fw fa-table"></i> Daily </a></li>
                                 <li><a href="net_view.jsp?filename=weekly.json&type=Weekly"><i class="fa fa-fw fa-table"></i> Weekly </a></li>
                               							
                      	   	  </ul>
						   </li>
						   </ul>
                        <li><a href="DataAnalysis.jsp"><i class="fa fa-fw fa-table"></i>Data-Analysis</a></li>
                        <li><a href=""><i class="fa fa-fw fa-file"></i>More About</a></li>
                        </ul>
		</div> -->
		</nav>

		<% 
		String type = request.getParameter("type");
	%>

		<style>
.link {
	fill: none;
	stroke: #666;
	stroke-width: 1.5px;
}

.linkSustain {
	fill: none;
	stroke: #0066FF;
	stroke-width: 1.5 px;
}

.linkEpisodic {
	fill: none;
	stroke: #FF0000;
	stroke-width: 1.5px;
}

.linkWeak {
	fill: none;
	stroke: #33CC33;
	stroke-with: 1.5px;
}

.node circle {
	stroke: #fff;
	stroke-width: 1.5px;
}

text {
	font: 10px sans-serif;
	pointer-events: none;
}
</style>

		<div id="page-wrapper">

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h2>
							<center>
								2005-2012 Whole Set Granger Causality - Granularity <%=type %>
							</center>
						</h2>

						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#home"
								onclick="window.location.reload(true);" data-toggle="tab">
									Network</a></li>

							<li><a id="In" href="#indegree" data-toggle="tab">Max Indegree</a></li>
							<li><a id="Out" href="#outdegree" data-toggle="tab">Max Outdegree</a></li>
							<li><a id="Cmp" href="#completeTriad" data-toggle="tab">CompleteTriad</a></li>
							<li><a id="Incmp" href="#IncompleteTriad" data-toggle="tab">IncompleteTriad</a></li>
							<li><a id="Imcycles" href="#ImmediateCycle" data-toggle="tab">ImmediateCycles</a></li>
							<li><a id="Chain" href="#Chain_show" data-toggle="tab">Chain</a></li>
							<li><a id="traces"  href="#tracepath" data-toggle="tab" >Trace Path</a></li>
							
							
						</ul>

						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="home">
								<script src="js/d3.min.js"></script>

								<div id="gc_network" style="border: 2px solid;">
									<br />


									<canvas id="graph_note" width="500" height="75"
										style="float: right"> </canvas>

									<script>				
					                            var ctx = document.getElementById("graph_note").getContext("2d");					                            
					                            SvgLoad(ctx);					                            			
				                            </script>

								</div>
							</div>
							<div class="tab-pane fade" id="indegree">
								<div id="borderIn" style="border: 2px solid;">
									<br />
									<canvas id="graph_note1" width="500" height="75"
										style="float: right"> </canvas>
									&nbsp; Max Indegree:
									<l id="max_indegree"></l>
									<script type="text/javascript">
									   		var ctx = document.getElementById("graph_note1").getContext("2d");					                            
				                            SvgLoadDegree(ctx);
											$("#In").click(function(){							   												   					
							   					$.ajax({
							   					  type: 'GET',
							   					  url: "Indegree?Quater=5",
							   					  dataType: 'json',
							   					  success: function(data,status) {//data.Links,data.nodes	
							   					  	document.getElementById("max_indegree").innerHTML = data.links.length;
							   						var width = 1000,height = 900;	
							   						
							   						DrawDegree(data.nodes, data.links,"#borderIn",width,height);	
							   						
							   			
							   					  },
							   					  error: function(data,error){
							   						  //alert(error);
							   						  },
							   					  async: false
							   					}); 							   					
							   				});
											
									   		</script>

								</div>


							</div>

							<div class="tab-pane fade" id="outdegree">
								<div id="borderOut" style="border: 2px solid;">
									<br />


									<canvas id="graph_note2" width="500" height="75"
										style="float: right"> </canvas>
									&nbsp; Max Outdegree:
									<l id="max_outdegree"></l>
									<script type="text/javascript">
									   		var ctx1 = document.getElementById("graph_note2").getContext("2d");					                            
				                            SvgLoadDegree(ctx1);
				                            
											$("#Out").click(function(){							   												   					
							   					$.ajax({
							   					  type: 'GET',
							   					  url: "Outdegree?Quater=5",
							   					  dataType: 'json',
							   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
							   						var width = 1000,height = 900;							   						
							   						DrawDegree(data.nodes, data.links,"#borderOut",width,height);
							   						document.getElementById("max_outdegree").innerHTML = data.links.length;							   						
							   					  },
							   					  error: function(data,error){alert(error);},
							   					  async: false
							   					}); 							   					
							   				});
											
									   		</script>

								</div>

							</div>

							<div class="tab-pane fade" id="completeTriad">
								<div id="borderCmp" style="border: 2px solid;">
									<br>

									<canvas id="graph_note3" width="500" height="75"
										style="float: right"> </canvas>
									<script type="text/javascript">
							   			var ctx2 = document.getElementById("graph_note3").getContext("2d");					                            
			                            SvgLoadCompTriad(ctx2);
			                            		
			                            $("#Cmp").click(function(){							   												   					
						   					$.ajax({
						   					  type: 'GET',
						   					  url: "CompleteTriad?Quater=5",
						   					  dataType: 'json',
						   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
						   						var width = 1000,height = 900;							   						
						   						//DrawGraph(data.nodes, data.Links,"#borderCmp",width,height);							   						
						   				DrawTrangleGraph(data.nodes, data.links,"#borderCmp",width,height);	 
                                         },
						   					  error: function(data,error){alert(error);},
						   					  async: false
						   					}); 							   					
						   				});
							   			</script>

								</div>
							</div>

							<div class="tab-pane fade" id="IncompleteTriad">
								<div id="borderIncmp" style="border: 2px solid;">
									<br />


									<canvas id="graph_note4" width="500" height="75"
										style="float: right"> </canvas>
									<script type="text/javascript">
							   			var ctx3 = document.getElementById("graph_note4").getContext("2d");					                            
			                            SvgLoadIncTriad(ctx3);
			                            		
			                            $("#Incmp").click(function(){							   												   					
						   					$.ajax({
						   					  type: 'GET',
						   					  url: "IncompleteTriad?Quater=5",
						   					  dataType: 'json',
						   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
						   						var width = 1000,height = 900;							   						
						   						//DrawGraph(data.nodes, data.Links,"#borderIncmp",width,height);
                                                DrawIncompleteTriad(data.nodes, data.links,"#borderIncmp",width,height);
						   					  },
						   					  error: function(data,error){alert(error);},
						   					  async: false
						   					}); 							   					
						   				});
							   			</script>

								</div>
							</div>

							<div class="tab-pane fade" id="ImmediateCycle">
								<div id="borderImcycle" style="border: 2px solid;">
									<br />


									<canvas id="graph_note5" width="500" height="75"
										style="float: right"> </canvas>
									<script type="text/javascript">
							   			var ctx4 = document.getElementById("graph_note5").getContext("2d");					                            
			                            SvgLoad(ctx4);
			                            		
			                            $("#Imcycles").click(function(){							   												   					
						   					$.ajax({
						   					  type: 'GET',
						   					  url: "ImmediateCycles?Quater=5",
						   					  dataType: 'json',
						   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
						   						var width = 1000,height = 900;							   						
						   						DrawGraph(data.nodes, data.links,"#borderImcycle",width,height);							   						
						   					  },
						   					  error: function(data,error){alert(error);},
						   					  async: false
						   					}); 							   					
						   				});
							   			</script>

								</div>
							</div>

							<%
								/*get the name of the file releven to clicked year ane filename */
								String filename = request.getParameter("filename");
								String name = "\'" + "json/" + filename + "\'";
								System.out.println(filename);
								//int Quater = Integer.parseInt(request.getParameter("Q"));
							%>

							<div class="tab-pane fade" id="QuarterlyTemporalPatterns">
								<div id="borderQgraph" style="border: 2px solid;">
									<br />


									<canvas id="graph_note6" width="800" height="80"
										style="float: left"></canvas>
									&nbsp; Clustering Coefficient :
									<l id="cc_show"></l>
									<button id="Sustained">Sustained</button>
									<button id="Episodic">Episodic</button>
									<button id="Weak">Weak</button>
									<script type="text/javascript">
							   					
							   					var file=<%= name%>;							   				
							   					var ctx=document.getElementById("graph_note6").getContext("2d");
							   					SvgQuarter(ctx);							   				
							   					 
							   					$("#Quarters").click(function(){
							   						var width = 900, height = 950;
							   						QuarterGraph(nodes, file, "#borderQgraph", width, height,quart);
							   						$.ajax({
									   					  type: 'GET',
									   					  url: "cc?Quater=5",
									   					  dataType: 'json',
									   					  success: function(data,status) {
									   						var cc = document.getElementById("cc_show").innerHTML = data.Clustering_C;
									   					  },
									   					  error: function(data,error){alert(error);},
									   					  async: false
									   					}); 								   													   			
								   				});
							   					
							   					$("#Sustained").click(function(){
							   						alert("sustained");
							   					});
							   					$("#Episodic").click(function(){
							   						alert("episodic");
							   					});
							   					$("#Weak").click(function(){
							   						alert("weak");
							   					});
							   				</script>

								</div>
							</div>
							<div class="tab-pane fade" id="Chain_show">
								<div id="borderChain" style="border: 2px solid;">
									<div><b>Note:</b>
										longer chain will find path only upto depth 3, due to computational complexity 
									</div>
									<br />


									<canvas id="graph_note9" width="500" height="75"
										style="float: right"> </canvas>
									<script type="text/javascript">
							   			var ctx3 = document.getElementById("graph_note9").getContext("2d");					                            
			                            SvgLoadChain(ctx3);
			                            		
			                            $("#Chain").click(function(){							   												   					
						   					$.ajax({
						   					  type: 'GET',
						   					  url: "chain?Quater=5",
						   					  dataType: 'json',
						   					  success: function(data,status) {//data.Links,data.nodes							   													   					 							   						    							   												   													   					
						   						var width = 1000,height = 900;							   						
						   						//DrawGraph(data.nodes, data.Links,"#borderIncmp",width,height);
                                                //DrawChain(data.nodes, data.links,"#borderChain",width,height);
                                                LongerChainInQuarterData(data.nodes, data.links,"#borderChain",width,height);
						   					  },
						   					  error: function(data,error){alert(error);},
						   					  async: false
						   					}); 							   					
						   				});
							   			</script>

								</div>
							</div>
							
							<!-- Trace paths -->
							   	<div class="tab-pane fade" id="tracepath">						   	
							   		<div id="tpath" style="border:2px solid;">
							   		<div><b>Note: </b> Click the initial node and mouseover the realted nodes to see all connected nodes. Click mouseovered node to trace the path. Double click the nodes to remove the trace.
							   		You can see the traced history by clicking previous node. Green edges indicates the traced path. 
							   		</div>
							   			<script>
							   			$("#traces").click(function(){
							   				var width = 900, height = 950;											
											TracePaths(nodes, file, "#tpath", width, height);
							   			});
							   			
							   			</script>						   		
							   		</div>
							   	</div>	
							
						</div>
						<script>							

							//load the nodes and links arrays
							$(document).ready(function(){
								var filename =<%=name%>
								
								<% String baseUrl="\'"+request.getScheme() + "://" + request.getServerName() + ":" + Integer.toString(request.getServerPort()) + request.getContextPath()+"/"+"\'";%>
								var url=<%=baseUrl%>+filename;
								
								var obj=new Object();
								obj.nodes=nodes;
										
								$.ajax({
									type: 'GET',
									url: url,
									dataType: 'json',
									success: function(data) { obj.link = data;},
									error: function(data,error){alert(error);},
									async: false
								}); 
										
								//alert(JSON.stringify(obj.link));
										//post the json string to servlet
								$.post("PostDataServ",JSON.stringify(obj)).error(function(){
									//alert("there is error while sending data to server");
								});;  
										//alert(JSON.stringify(obj.link));
										
								});
								//graphload 
								var width = 900, height = 950;
								var quart = 5;
								
								OriginalNetworkGraph(nodes, file, "#gc_network", width, height,quart);
								</script>
					</div>
				</div>
			</div>
		</div>

		<!-- /#wrapper -->

		<!-- jQuery Version 1.11.0 -->
		<script src="js/jquery-1.11.0.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>

		<!-- Morris Charts JavaScript -->
		<script src="js/plugins/morris/raphael.min.js"></script>
		<script src="js/plugins/morris/morris.min.js"></script>
		<script src="js/plugins/morris/morris-data.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/jquery-ui.js"></script>
		
	</div>
</body>

</html>
