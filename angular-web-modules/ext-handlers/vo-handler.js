// This handler expects a list of String as a value of parameter "attributes"
// The strings have the format <Type> <attributeName>
//
// Example:
//   - template : java/java-bean
//     params :
//       className : Person
//       attributes :
//         - String firstName
//         - String lastName
//         - Integer age 
//
// This handler then creates another parameter called 'enhAttributes', value
// of which is a list of objects with following keys
//
// -> type
// -> varName
// -> defaultVal
// -> setterName
// -> getterName
//
var ArrayList = Java.type( 'java.util.ArrayList' ) ;
var Map = Java.type( 'java.util.HashMap' ) ;
var TransformationConfig = Java.type( 'com.sandy.codegen.config.TransformationConfig' ) ;

function execute( cfg ) {
    
    var params = cfg.getParams() ;
    var attributes = params.attributes ;
    var enhAttributes = new ArrayList();
    
    for( var i=0; i<attributes.length; i++ ) {
        var attrDef = attributes[i] ;
        enhAttributes.add( createEndAttr( attrDef ) ) ;
    }
    
    params.enhAttributes = enhAttributes ;
    
    return null ;
}

function createEndAttr( attrDef ) {
    
    var enhAttr = new Map() ;
    var defParts = attrDef.split( " " ) ;
    
    enhAttr.type = defParts[0] ;
    enhAttr.varName = defParts[1] ;
    
    if( enhAttr.type == 'int' ) {
        enhAttr.defaultVal = '0' ;
    }
    else if( enhAttr.type == 'float' ) {
        enhAttr.defaultVal = '0.0' ;
    }
    else if( enhAttr.type == 'double' ) {
        enhAttr.defaultVal = '0.0' ;
    }
    else if( enhAttr.type == 'boolean' ) {
        enhAttr.defaultVal = 'false' ;
    }
    else {
        enhAttr.defaultVal = 'null' ;
    }
    
    var capVarName = enhAttr.varName[0].toUpperCase() + 
                     enhAttr.varName.slice( 1 ) ;
    enhAttr.setterName = 'set' + capVarName ;
    
    if( enhAttr.type == 'boolean' ) {
        enhAttr.getterName = 'is' + capVarName ;
    }
    else {
        enhAttr.getterName = 'get' + capVarName ; 
    }
    
    return enhAttr ;
}