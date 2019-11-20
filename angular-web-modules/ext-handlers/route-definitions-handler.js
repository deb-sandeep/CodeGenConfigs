var ArrayList = Java.type( 'java.util.ArrayList' ) ;
var Map = Java.type( 'java.util.HashMap' ) ;
var TransformationConfig = Java.type( 'com.sandy.codegen.config.TransformationConfig' ) ;

function execute( cfg ) {
    
    var params = cfg.getParams() ;
    var routeDefs = params.routeDefinitions ;
    var transformations = new ArrayList();
    
    for( var i=0; i<routeDefs.length; i++ ) {
        var def = routeDefs[i] ;
        
        var trans1 = createControllerTransformation( def ) ;
        transformations.add( trans1 ) ;
        
        var trans2 = createHTMLTransformation( def ) ;
        transformations.add( trans2 ) ;
    }
    
    return transformations ;
}

function createControllerTransformation( def ) {
    
    var trans = new TransformationConfig() ;
    
    var templateHTMLPath = def.templateUrl ;
    var controllerName = def.controllerName ;
    
    trans.template = 'js/route-controller' ;
    trans.destination = '${env.moduleDirPath}/js/' + controllerName + '.js' ;
    trans.params = new Map() ;
    trans.params.put( 'title', '${env.moduleId} Home' ) ;
    trans.params.put( 'controllerName', controllerName ) ;
    
    return trans ;
}

function createHTMLTransformation( def ) {
    
    var trans = new TransformationConfig() ;
    
    trans.template = 'html/route-home-html' ;
    trans.destination = '${env.moduleDirPath}/template/${env.moduleId}Home.html' ;
    trans.params = new Map() ;
    
    return trans ;
}