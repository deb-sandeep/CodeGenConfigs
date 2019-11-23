    @$apiType$Mapping( "$url$" ) 
    public ResponseEntity<$returnType$> $methodName$($if(requestBodyType)$ @RequestBody $requestBodyType$ input $endif$) {
        try {
            log.debug( "$message$." ) ;
            $returnType$ results = null ;
            
            return ResponseEntity.status( HttpStatus.OK )
                                 .body( results ) ;
        }
        catch( Exception e ) {
            log.error( "Error :: $message$.", e ) ;
            return ResponseEntity.status( HttpStatus.INTERNAL_SERVER_ERROR )
                                 .body( null ) ;
        }
    }