$! extHandler: vo-handler !$
public class $className$ {

    $enhAttributes:{private $it.type$ $it.varName$ = $it.defaultVal$ ;
}$
    public $className$() {}
    $enhAttributes:{
public void $it.setterName$( $it.type$ val ) {
    this.$it.varName$ = val ;
}
    
public $it.type$ $it.getterName$() {
    return this.$it.varName$ ;
}
}$
    public String toString() {
        StringBuilder builder = new StringBuilder( "$className$ [\n" ) ; 
$enhAttributes:{
        builder.append( "   $it.varName$ = " + this.$it.varName$ + "\n" ) ;}$
        builder.append( "]" ) ;
        
        return builder.toString() ;
    }
}