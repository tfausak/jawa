module Jawa.Event.BufferTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Buffer
import Jawa.Extra.Test
import Jawa.State
import Jawa.StateTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Buffer"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Buffer.decoder Jawa.Event.Buffer.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Buffer.decoder
            Jawa.Event.Buffer.encode
            """ {
                "oldstate": "idle",
                "newstate": "buffering",
                "reason": "loading"
            } """
            { oldstate = Jawa.State.Idle
            , newstate = Jawa.State.Buffering
            , reason = Jawa.State.Loading
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Buffer.Buffer
fuzzer =
    Fuzz.map3 Jawa.Event.Buffer.Buffer
        Jawa.StateTest.fuzzer
        Jawa.StateTest.fuzzer
        Jawa.StateTest.fuzzer
