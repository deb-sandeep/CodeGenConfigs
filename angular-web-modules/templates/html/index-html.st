<!DOCTYPE html>
<html ng-app="$env.baseNgApp$">
<head>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$pageTitle$</title>
    <script src="/js/lib/angular/angular.min.js"></script>
    <script src="/js/lib/angular/angular-route.min.js"></script>
    <script src="/js/lib/jquery/jquery.min.js"></script>
    <script src="/js/lib/bootstrap/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="/js/lib/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/app/app.css"/>
    
    <script src="/js/app/app-ng.js"></script>
    <script src="/views/$env.moduleDirName$/js/controller.js"></script>
    <script src="/views/$env.moduleDirName$/js/directive.js"></script>
    <script src="/views/$env.moduleDirName$/js/route.js"></script>
    <script src="/views/$env.moduleDirName$/js/filter.js"></script>
    <script src="/views/$env.moduleDirName$/js/$env.moduleId$HomeController.js"></script>
</head>

<body ng-controller="$env.moduleId$Controller"
      style="background-color: #FFFFFF;">

<nav class="navbar navbar-inverse navbar-static-top"
     style="min-height:0px;margin-bottom:0px;">
    <div class="container" style="width:100%">
        <div class="row" >
            <div class="col-sm-7">
                [ <a href="/views/landing/landing.html">$env.projectDisplayName$</a> ] - {{navBarTitle}}
            </div>
            <div class="col-sm-5">
                <!-- Space for controls common to module -->
            </div>
        </div>
    </div>
</nav>

<div class="alert alert-danger alert-dismissible" ng-repeat="alert in alerts">
<a ng-click="dismissAlert( \$index )" class="close" data-dismiss="alert" aria-label="close">&times;</a>
{{alert.msg}}
</div>

<div ng-view></div>

</body>
</html>