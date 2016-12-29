module App exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import CSS
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
    = Count
    | ChangeInput String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Count ->
            ( { model | program = model.program ++ "!" }, Cmd.none )

        ChangeInput content ->
            ( { model | program = content }, Cmd.none )



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
                [ div [ CSS.column ] [ model.program |> text ]
                , div [ CSS.column ] [ textarea [ onInput ChangeInput ] [] ]
                ]
            ]
        ]
