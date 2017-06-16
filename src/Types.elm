module Types exposing (..)


type alias QuestionId =
    Int


type alias Question =
    { question : String
    , id : QuestionId
    , proceedPath : QuestionId
    , proceedLabel : String
    , responsePath : QuestionId
    , responseLabel : String
    , responseText : String
    }


type Msg
    = SetCurrentQuestion QuestionId
    | ResetQuestions
