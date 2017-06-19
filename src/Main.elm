module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (..)
import Questions
    exposing
        ( anyQuestion
        , defaultQuestion
        , failureId
        , failureQuestion
        , finishId
        , finishQuestion
        , initQuestions
        , startId
        , startQuestion
        )
import Types exposing (..)


-- Model


type alias Model =
    { questions : List Question
    , currentQuestion : QuestionId
    , lastQuestion : QuestionId
    }


init : ( Model, Cmd.Cmd Msg )
init =
    ( { questions = initQuestions
      , currentQuestion = startId
      , lastQuestion = startId
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
            ( { model
                | currentQuestion = questionId
                , lastQuestion = model.currentQuestion
              }
            , Cmd.none
            )

        ResetQuestions ->
            init



-- View


getCurrentQuestion : Model -> Question
getCurrentQuestion model =
    List.filter (\q -> q.id == model.currentQuestion) model.questions
        |> List.head
        |> Maybe.withDefault defaultQuestion


getLastQuestion : Model -> Question
getLastQuestion model =
    List.filter (\q -> q.id == model.lastQuestion) model.questions
        |> List.head
        |> Maybe.withDefault defaultQuestion


view : Model -> Html Msg
view model =
    let
        renderQuestion =
            if model.currentQuestion == startId then
                startQuestion (getCurrentQuestion model)
            else if model.currentQuestion == failureId then
                failureQuestion (getCurrentQuestion model) (getLastQuestion model)
            else if model.currentQuestion == finishId then
                finishQuestion (getCurrentQuestion model)
            else
                anyQuestion (getCurrentQuestion model)

        totalQuestions =
            toFloat <| List.length model.questions - 2

        currentQuestionToFloat =
            toFloat <| clamp 0 (List.length model.questions) model.currentQuestion

        calculateProgress =
            toString (currentQuestionToFloat / totalQuestions * 100) ++ "%"

        renderProgressBar =
            div [ class "progress-bar" ]
                [ div [ style [ ( "width", calculateProgress ) ], class "progress-indication" ] [] ]
    in
    div [ class "full-height" ]
        [ renderProgressBar
        , renderQuestion
        ]
