module CSS exposing (..)

import Html.Attributes exposing (style)
import Html exposing (Attribute)


mainStyle : Html.Attribute a
mainStyle =
    style
        [ ( "padding", "15px" )
        , ( "width", "100%" )
        , ( "height", "100%" )
        , ( "font-family", "monospace" )
        , ( "font-size", "14px" )
        , ( "float", "left" )
        ]


listStyle : Html.Attribute a
listStyle =
    style
        [ ( "list-style-type", "none" )
        , ( "padding", "10px 5px" )
        , ( "border-radius", "4px" )
        , ( "background-color", "#68C4F2" )
        ]


buttonStyle : Html.Attribute a
buttonStyle =
    style
        [ ( "border", "1px solid silver" )
        , ( "border-radius", "5px" )
        , ( "padding", "2px 5px" )
        ]
