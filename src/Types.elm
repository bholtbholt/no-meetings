module Types exposing (..)


type alias QuestionId =
    Int


type alias Question =
    { id : QuestionId
    , question : String
    , description : String
    , proceedPath : QuestionId
    , proceedLabel : String
    , responsePath : QuestionId
    , responseLabel : String
    , responseText : String
    }


type Msg
    = SetCurrentQuestion QuestionId
    | ResetQuestions
