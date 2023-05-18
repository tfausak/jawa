module Jawa.Event.PlayTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Play
import Jawa.Extra.Test
import Jawa.PlayReason
import Jawa.PlayReasonTest
import Jawa.State
import Jawa.StateTest
import Jawa.Viewable
import Jawa.ViewableTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Play"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Play.decoder Jawa.Event.Play.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Play.decoder
            Jawa.Event.Play.encode
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "playReason": "external",
                "reason": "error",
                "viewable": 0
            } """
            { newstate = Jawa.State.Buffering
            , oldstate = Jawa.State.Complete
            , playReason = Jawa.PlayReason.External
            , reason = Jawa.State.Error
            , viewable = Jawa.Viewable.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Play.Play
fuzzer =
    Fuzz.map5 Jawa.Event.Play.Play
        Jawa.StateTest.fuzzer
        Jawa.StateTest.fuzzer
        Jawa.PlayReasonTest.fuzzer
        Jawa.StateTest.fuzzer
        Jawa.ViewableTest.fuzzer
