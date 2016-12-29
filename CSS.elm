module CSS exposing (..)

import Html.Attributes exposing (style)
import Html exposing (Attribute)


body : Html.Attribute a
body =
    style
        [ ( "padding", "15px" )
        , ( "width", "100%" )
        , ( "height", "100%" )
        , ( "font-family", "monospace" )
        , ( "font-size", "14px" )
        , ( "float", "left" )
        ]


list : Html.Attribute a
list =
    style
        [ ( "list-style-type", "none" )
        , ( "padding", "10px 5px" )
        , ( "border-radius", "4px" )
        , ( "background-color", "#68C4F2" )
        ]


button : Html.Attribute a
button =
    style
        [ ( "border", "1px solid silver" )
        , ( "border-radius", "5px" )
        , ( "padding", "2px 5px" )
        ]


column : Html.Attribute a
column =
    style
        [ ( "display", "inline-block" )
        , ( "width", "50%" )
        ]


content : Html.Attribute a
content =
    style
        []


header : Html.Attribute a
header =
    style
        []
