module Questions
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

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


startId : QuestionId
startId =
    0


failureId : QuestionId
failureId =
    -1


finishId : QuestionId
finishId =
    99


defaultQuestion : Question
defaultQuestion =
    { id = startId
    , question = "There was an error loading the question."
    , proceedPath = startId
    , proceedLabel = "Restart"
    , responsePath = startId
    , responseLabel = ""
    , responseText = ""
    }


initQuestions : List Question
initQuestions =
    [ { id = startId
      , question = "Should this be a meeting?"
      , proceedPath = 1
      , proceedLabel = "Start"
      , responsePath = startId
      , responseLabel = ""
      , responseText = ""
      }
    , { id = failureId
      , question = "Failure"
      , proceedPath = startId
      , proceedLabel = "Restart"
      , responsePath = failureId
      , responseLabel = ""
      , responseText = ""
      }
    , { id = finishId
      , question = "Let’s Have A Meeting!"
      , proceedPath = startId
      , proceedLabel = "Restart"
      , responsePath = finishId
      , responseLabel = ""
      , responseText = "Remember to: Share the agenda and goals of the meeting with your attendees. Add a Zoom link to the meeting in Google calendar. Book meeting rooms for all locations involved. Show up on time and ready. To step up your meeting game, consult this post about Running Better Meetings."
      }
    , { id = 1
      , question = "Is this an important topic?"
      , proceedPath = 2
      , proceedLabel = "Yes"
      , responsePath = failureId
      , responseLabel = "No"
      , responseText = "Don’t meet. If this item isn’t business critical, consider dealing with this topic another way."
      }
    , { id = 2
      , question = "Can it be solved by collaborating without meeting?"
      , proceedPath = 3
      , proceedLabel = "No"
      , responsePath = failureId
      , responseLabel = "Yes"
      , responseText = "Use other collaboration options. Collaborate on a task using your PM tool, or run a survey, or do a quick group chat on Slack."
      }
    , { id = 3
      , question = "Does it require everyone to participate?"
      , proceedPath = 4
      , proceedLabel = "Yes"
      , responsePath = failureId
      , responseLabel = "No"
      , responseText = "Limit attendees. Limit the meeting to essential participants only. When done, go to 4."
      }
    , { id = 4
      , question = "Does the group have authority to act?"
      , proceedPath = 5
      , proceedLabel = "Yes"
      , responsePath = 6
      , responseLabel = "No"
      , responseText = ""
      }
    , { id = 5
      , question = "Can the key participants and decision-makers attend?"
      , proceedPath = 7
      , proceedLabel = "Yes"
      , responsePath = 6
      , responseLabel = "No"
      , responseText = ""
      }
    , { id = 6
      , question = "Is there still value? Can the group still add significant value by meeting?"
      , proceedPath = 7
      , proceedLabel = "Yes"
      , responsePath = failureId
      , responseLabel = "No"
      , responseText = "Stop here and don’t meet. Reevaluate if it is possible to use other collaboration options."
      }
    , { id = 7
      , question = "Is there pre-work requested of key participants?"
      , proceedPath = 8
      , proceedLabel = "Yes"
      , responsePath = failureId
      , responseLabel = "No"
      , responseText = "Add pre-work. Do as much possible before the meeting to cut down on meeting time. When done, go to 8."
      }
    , { id = 8
      , question = "Is there an agenda with clear goals?"
      , proceedPath = 9
      , proceedLabel = "Yes"
      , responsePath = failureId
      , responseLabel = "No"
      , responseText = "Add agenda and goals. Define clear outcomes and a process to get them. When done, go to 9."
      }
    , { id = 9
      , question = "Is there enough time to get to the desired outcome?"
      , proceedPath = 10
      , proceedLabel = "Yes"
      , responsePath = failureId
      , responseLabel = "No"
      , responseText = "Alter goals or reschedule. Make sure meaningful goals can be achieved within your time frame. If altering is impossible, reschedule your meeting to allow a long enough meeting to achieve goals. When done, go to 10."
      }
    , { id = 10
      , question = "Is there a strong meeting facilitator?"
      , proceedPath = finishId
      , proceedLabel = "Yes"
      , responsePath = failureId
      , responseLabel = "No"
      , responseText = "Find a “driver”. You need someone who can drive the meeting by keeping track of time, the agenda and keeping the group focused on the goals. When done, go to 11."
      }
    ]


anyQuestion : Question -> Html Msg
anyQuestion question =
    div [ id (toString question.id) ]
        [ h1 [] [ text question.question ]
        , button [ onClick (SetCurrentQuestion question.responsePath) ] [ text question.responseLabel ]
        , button [ onClick (SetCurrentQuestion question.proceedPath) ] [ text question.proceedLabel ]
        ]


startQuestion : Question -> Html Msg
startQuestion question =
    div [ id (toString question.id) ]
        [ h1 [] [ text question.question ]
        , button [ onClick (SetCurrentQuestion question.proceedPath) ] [ text question.proceedLabel ]
        ]


finishQuestion : Question -> Html Msg
finishQuestion question =
    div [ id (toString question.id) ]
        [ h1 [] [ text question.question ]
        , p [] [ text question.responseText ]
        , button [ onClick ResetQuestions ] [ text question.proceedLabel ]
        ]


failureQuestion : Question -> Question -> Html Msg
failureQuestion question lastQuestion =
    div [ id (toString question.id) ]
        [ h1 [] [ text lastQuestion.question ]
        , p [] [ text lastQuestion.responseText ]
        , button [ onClick ResetQuestions ] [ text question.proceedLabel ]
        ]
