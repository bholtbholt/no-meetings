module Questions exposing (..)

-- Types


type alias QuestionId =
    Int


type alias Question =
    { question : String
    , id : QuestionId
    , proceed : QuestionId
    , response : String
    , proceedLabel : String
    , responseLabel : String
    }


initQuestions : List Question
initQuestions =
    [ { id = 0
      , question = "Should this be a meeting?"
      , proceed = 1
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "What are you doing here? Get back to work!"
      }
    , { id = 1
      , question = "Is this an important topic?"
      , proceed = 2
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Don’t meet. If this item isn’t business critical, consider dealing with this topic another way."
      }
    , { id = 2
      , question = "Can it be solved by collaborating without meeting?"
      , proceed = 3
      , proceedLabel = "No"
      , responseLabel = "Yes"
      , response = "Use other collaboration options. Collaborate on a task using your PM tool, or run a survey, or do a quick group chat on Slack."
      }
    , { id = 3
      , question = "Does it require everyone to participate?"
      , proceed = 4
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Limit attendees. Limit the meeting to essential participants only. When done, go to 4."
      }
    , { id = 4
      , question = "Does the group have authority to act?"
      , proceed = 5
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Go to 6"
      }
    , { id = 5
      , question = "Can the key participants and decision-makers attend?"
      , proceed = 7
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Go to 6"
      }
    , { id = 6
      , question = "Is there still value? Can the group still add significant value by meeting?"
      , proceed = 7
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Stop here and don’t meet. Reevaluate if it is possible to use other collaboration options."
      }
    , { id = 7
      , question = "Is there pre-work requested of key participants?"
      , proceed = 8
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Add pre-work. Do as much possible before the meeting to cut down on meeting time. When done, go to 8."
      }
    , { id = 8
      , question = "Is there an agenda with clear goals?"
      , proceed = 9
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Add agenda and goals. Define clear outcomes and a process to get them. When done, go to 9."
      }
    , { id = 9
      , question = "Is there enough time to get to the desired outcome?"
      , proceed = 10
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Alter goals or reschedule. Make sure meaningful goals can be achieved within your time frame. If altering is impossible, reschedule your meeting to allow a long enough meeting to achieve goals. When done, go to 10."
      }
    , { id = 10
      , question = "Is there a strong meeting facilitator?"
      , proceed = 11
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Find a “driver”. You need someone who can drive the meeting by keeping track of time, the agenda and keeping the group focused on the goals. When done, go to 11."
      }
    , { id = 11
      , question = "Let’s Have A Meeting!"
      , proceed = 0
      , proceedLabel = "Yes"
      , responseLabel = "No"
      , response = "Remember to: Share the agenda and goals of the meeting with your attendees. Add a Zoom link to the meeting in Google calendar. Book meeting rooms for all locations involved. Show up on time and ready. To step up your meeting game, consult this post about Running Better Meetings."
      }
    ]
