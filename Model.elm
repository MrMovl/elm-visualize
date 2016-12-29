module Model exposing (..)


type alias ProgramRepresentation =
    { modules : List ModuleRep }


type alias ModuleRep =
    { moduleName : String
    , exports : List ExportRep
    , imports : List ImportStatement
    , functions : List FunctionRep
    }


type alias ImportStatement =
    { name : String
    , exports : List ExportRep
    }


type alias ExportRep =
    { exportType : ExportType
    , name : String
    }


type ExportType
    = FunctionExport
    | TypeExport
    | AllExport


type alias FunctionRep =
    { signature : Maybe SignatureRep
    , function : DeclarationRep
    }


type alias DeclarationRep =
    { functionName : String
    , parameters : List String
    , body : BodyRep
    }


type alias BodyRep =
    { operations : List OperationRep }


type alias OperationRep =
    String


type alias SignatureRep =
    { functionName : String
    , types : List String
    }


sample1 : ProgramRepresentation
sample1 =
    ProgramRepresentation
        [ ModuleRep "Main"
            [ ExportRep AllExport "AllExport" ]
            []
            [ FunctionRep
                (Just (SignatureRep "f" [ "Int", "Int" ]))
                (DeclarationRep "f" [ "x" ] (BodyRep [ "BinOp (Variable ['+']) (Variable ['x']) (Integer 1)" ]))
            , FunctionRep
                (Just (SignatureRep "g" [ "Int", "Int" ]))
                (DeclarationRep "g" [ "x" ] (BodyRep [ "BinOp (Variable ['*']) (Variable ['x']) (Integer 2)" ]))
            , FunctionRep
                (Nothing)
                (DeclarationRep "h" [] (BodyRep [ "BinOp (Variable ['<<']) (Variable ['f']) (Variable ['g'])" ]))
            ]
        ]
