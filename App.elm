module App exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import CSS
import AcyclicDigraph exposing (Node, Edge, Cycle, AcyclicDigraph)
import ArcDiagram
import Set exposing (Set)
import Dict exposing (Dict)
import Model exposing (sample1, ProgramRepresentation)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { program : ProgramRepresentation }


init : ( Model, Cmd Msg )
init =
    ( Model sample1, Cmd.none )



-- UPDATE


type Msg
    = ChangeInput String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeInput content ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ CSS.body ]
        [ h1 [ CSS.header ] [ text "elm visualize" ]
        , div [ CSS.content ]
            [ div []
                [ h2 [ CSS.column ] [ text "Output" ]
                , h2 [ CSS.column ] [ text "Input" ]
                ]
            , div []
                [ div [ CSS.column ] [ printGraph exampleGraph ]
                , div [ CSS.column ] [ textarea [ onInput ChangeInput ] [] ]
                ]
            ]
        ]


type alias Graph =
    ( Set Edge, Dict Node String )


exampleGraph =
    ( exampleEdges, exampleLabels )


printGraph : Graph -> Html Msg
printGraph ( edges, labels ) =
    let
        toLabel =
            (flip Dict.get) labels >> Maybe.withDefault ""

        graphView =
            case AcyclicDigraph.fromEdges edges of
                Err cycles ->
                    viewCycles toLabel cycles

                Ok graph ->
                    ArcDiagram.view
                        ArcDiagram.defaultLayout
                        (ArcDiagram.basicPaint toLabel)
                        graph
    in
        Html.div [ CSS.graphStyle ] [ graphView ]


viewCycles : (Node -> String) -> List Cycle -> Html a
viewCycles toLabel cycles =
    Html.div
        []
        [ Html.text "Graph has the following cycles:"
        , Html.ol
            []
            (cycles |> List.map (viewCycle toLabel))
        ]


viewCycle : (Node -> String) -> Cycle -> Html a
viewCycle toLabel cycle =
    Html.li
        []
        [ Html.text (cycle |> List.map toLabel |> String.join " -> ") ]



-- example data


exampleEdges : Set Edge
exampleEdges =
    Set.fromList
        [ ( 2, 1 )
        , ( 3, 1 )
        , ( 3, 2 )
        , ( 4, 2 )
        , ( 5, 3 )
        , ( 5, 4 )
          --, (5, 9) -- make cycle
        , ( 6, 4 )
        , ( 7, 4 )
        , ( 8, 1 )
        , ( 8, 3 )
        , ( 8, 4 )
        , ( 8, 6 )
        , ( 9, 1 )
        , ( 9, 3 )
        , ( 9, 5 )
        , ( 9, 6 )
        ]


exampleLabels : Dict Node String
exampleLabels =
    Dict.fromList
        [ ( 1, "Alfa" )
        , ( 2, "Bravo" )
        , ( 3, "Charlie" )
        , ( 4, "Delta" )
        , ( 5, "Echo" )
        , ( 6, "Foxtrot" )
        , ( 7, "Golf" )
        , ( 8, "Hotel" )
        , ( 9, "India" )
        ]
