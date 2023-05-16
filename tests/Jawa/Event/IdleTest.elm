module Jawa.Event.IdleTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Idle
import Jawa.State
import Jawa.StateTest
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Idle"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Idle.decoder Jawa.Event.Idle.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Idle.decoder
            Jawa.Event.Idle.encoder
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "reason": "error"
            } """
            { newstate = Jawa.State.Buffering
            , oldstate = Jawa.State.Complete
            , reason = Jawa.State.Error
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Idle.Idle
fuzzer =
    Fuzz.map3 Jawa.Event.Idle.Idle
        Jawa.StateTest.fuzzer
        Jawa.StateTest.fuzzer
        Jawa.StateTest.fuzzer
