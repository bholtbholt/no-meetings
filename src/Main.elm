module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import List exposing (..)
import Questions exposing (Question, QuestionId, initQuestions, view)


--import Html.Attributes exposing (..)
-- Program


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = init
        , subscriptions = always Sub.none
        }



-- Model


type alias Model =
    { questions : List Question
    , currentQuestion : QuestionId
    }


init : ( Model, Cmd.Cmd Msg )
init =
    ( { questions = initQuestions
      , currentQuestion = 0
      }
    , Cmd.none
    )



--- Update


type Msg
    = ChangeQuestion Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeQuestion value ->
            ( { model | currentQuestion = model.currentQuestion + value }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    let
        getQuestion =
            List.head <|
                List.filter (\q -> q.id == model.currentQuestion) model.questions

        showQuestion maybeQuestion =
            case maybeQuestion of
                Just value ->
                    Questions.view value

                Nothing ->
                    text "default"
    in
    div []
        [ div [] [ showQuestion getQuestion ]
        , button [ onClick (ChangeQuestion -1) ] [ text "decrement" ]
        , button [ onClick (ChangeQuestion 1) ] [ text "increment" ]
        , div [] [ text (toString model) ]
        ]
