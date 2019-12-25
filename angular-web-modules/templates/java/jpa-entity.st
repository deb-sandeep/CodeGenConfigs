$! extHandler: vo-handler !$
@Entity
@Table( name = "$tableName$" )
public class $className$ {

    @Id
    @GeneratedValue( strategy=GenerationType.AUTO )
    private Integer id = null ;
    
    $enhAttributes:{private $it.type$ $it.varName$ = $it.defaultVal$ ;
}$
    public $className$() {}
    
    public void setId( Integer val ) {
        this.id = val ;
    }
        
    public Integer getId() {
        return this.id ;
    }
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
        
        builder.append( "   id = " + this.id + "\n" ) ;$enhAttributes:{
        builder.append( "   $it.varName$ = " + this.$it.varName$ + "\n" ) ;}$
        builder.append( "]" ) ;
        
        return builder.toString() ;
    }
}