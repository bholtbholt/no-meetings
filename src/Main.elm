module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import List exposing (..)
import Questions exposing (initQuestions, view)
import Types exposing (..)


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


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = init
        , subscriptions = always Sub.none
        }



--- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetCurrentQuestion questionId ->
            ( { model | currentQuestion = questionId }, Cmd.none )

        ResetQuestions ->
            init



-- View


view : Model -> Html Msg
view model =
    let
        getQuestion =
            List.head <|
                List.filter (\q -> q.id == model.currentQuestion) model.questions

        showQuestion maybeQuestion =
            case maybeQuestion of
                Just question ->
                    Questions.view question

                Nothing ->
                    text "There was an error"
    in
    div []
        [ div [] [ showQuestion getQuestion ]
        , button [ onClick ResetQuestions ] [ text "Reset" ]
        , div [] [ text (toString model) ]
        ]
