module Jawa.Event.PauseTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Pause
import Jawa.Extra.Test
import Jawa.PauseReason
import Jawa.PauseReasonTest
import Jawa.State
import Jawa.StateTest
import Jawa.Viewable
import Jawa.ViewableTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Pause"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Pause.decoder Jawa.Event.Pause.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Pause.decoder
            Jawa.Event.Pause.encode
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "pauseReason": "external",
                "reason": "error",
                "viewable": 0
            } """
            { newstate = Jawa.State.Buffering
            , oldstate = Jawa.State.Complete
            , pauseReason = Just Jawa.PauseReason.External
            , reason = Jawa.State.Error
            , viewable = Jawa.Viewable.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Pause.Pause
fuzzer =
    Fuzz.map5 Jawa.Event.Pause.Pause
        Jawa.StateTest.fuzzer
        Jawa.StateTest.fuzzer
        (Fuzz.maybe Jawa.PauseReasonTest.fuzzer)
        Jawa.StateTest.fuzzer
        Jawa.ViewableTest.fuzzer
