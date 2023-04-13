module Jawa.Event.PauseTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Pause as Pause
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as V
import Jawa.ViewableTest as V
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Pause.decoder Pause.encoder fuzzer
        , TestExtra.testCodec "works"
            Pause.decoder
            Pause.encoder
            """ {
                "newstate": "a",
                "oldstate": "b",
                "pauseReason": "c",
                "reason": "d",
                "viewable": 0
            } """
            { newstate = "a"
            , oldstate = "b"
            , pauseReason = "c"
            , reason = "d"
            , viewable = V.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Pause.Pause
fuzzer =
    Fuzz.map5 Pause.Pause
        Fuzz.string
        Fuzz.string
        Fuzz.string
        Fuzz.string
        V.fuzzer
