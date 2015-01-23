<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>GCVisualizer - Karsha project</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sb-admin.css" rel="stylesheet">
        <link href="css/plugins/morris.css" rel="stylesheet">
        <link href="font-awesome-4.1.0/css/font-awesome.min.css"
              rel="stylesheet" type="text/css">
        <link href="css/jquery-ui.css" rel="stylesheet">
        <style>
            .link {
                fill: none;
                stroke: #666;
                stroke-width: 1.5px;
            }

            .node circle {
                stroke: #fff;
                stroke-width: 1.5px;
            }

            text {
                font: 10px sans-serif;
                pointer-events: none;
            }

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

    <body>
        <div id="wrapper">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><font color="white">Karsha Visualizer - 2005-2012 Whole Set GC Enhanced Daily/Weekly</font></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li class="active"><a href="index.jsp"><i class="fa fa-fw fa-dashboard"></i> Karsha Visualizer</a></li>
                       <li><a href="net_view.jsp?filename=daily.json&year=2005&Q=5&type=Daily"><i class="fa fa-fw fa-table"></i> Daily </a></li>           
						<li><a href="net_view.jsp?filename=weekly.json&year=2005&Q=5&type=Weekly"><i class="fa fa-fw fa-table"></i> Weekly </a></li>     
                        <li><a href="DataAnalysis.jsp"><i class="fa fa-fw fa-table"></i>Data-Analysis</a></li>
                        <li><a href=""><i class="fa fa-fw fa-file"></i>More About</a></li>

                    </ul>
                 
                </div>
            </nav>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Granger Causality Visualizer<small></small>
                            </h1>
                            <ol class="breadcrumb">
                                <li class="active"><i class="fa fa-dashboard"></i>
                                    Visualizer</li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <ul>
                            <p><strong>The Karsha GC Visualizer presents  Granger Causality(GC) based interaction patterns when comparing</br> the market volume of trades in US corporate bonds and US equities, grouped by NAICS industry sectors.</strong></p>


                            <p>We provide the following analysis for  adjusted volume of industry pairs over the whole data set</br> 
                                from 2005 to 2012 using Daily/Weekly granularity. </p>
                            <ul>
                                <li>Network and nodes with the greatest indegree and outdegree.</li>
                                <li>Immediate cycles.</li>
                                <li>Complete and incomplete triads.</li>
                                <li>Immediate cycles.</li>
                                <li>Cluster coefficients.</li>
                                <li>Long chains.</li>
                            </ul>
                            </br>
                            <p>We provide the following charts for the Daily and Weekly GC-Networks:</p>
                            <ul>
                                <li>Cluster coefficient.</li>
                                <li>Edge count.</li>
                                <li>Complete triad count.</li>
                                <li>Incomplete triad count.</li>
                            </ul>
                            </br>
                            <p><strong>Dataset</strong></br>
                                We report on the period 2005 - 2013. The data is obtained from the following repositories:</br>
                                <a href="http://www.crsp.com/">The Center for Research in Security Prices(CRSP) </a>Daily Equity Data</br>
                                <a href="http://www.finra.org/industry/compliance/markettransparency/trace/">Trade Reporting and Compliance Engine (TRACE) </a> Daily Bond Data
                            </p>
                            <ul>
                                <li>Match equities and bonds over the ticker and date.</li>
                                <li>Discard unmatched data.</li>
                                <li>Aggregate market volume (total value traded) daily for each equity and bond.</br> The average over the high and low daily prices for the equities are used to determine market volume.</li>
                                <li>Aggregate equity and bond volumes separately by 2-digit NAICS industry sector code </br>
                                    and divide the bond volumes to Bond-HighYield and Bond-InvGradeto create 22 * 3 portfolios.</br>  Then take the log of this volume.</li>
                            </ul>
                        </ul>
                    </div>
                    <center>
<
                        <!-- /.row -->

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- /#page-wrapper -->
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
            <script>
                $("#accordion").accordion();
            </script>
    </body>

</html>
