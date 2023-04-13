module Jawa.Event.PauseTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Pause as Pause
import Jawa.State as S
import Jawa.StateTest as S
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
                "newstate": "buffering",
                "oldstate": "complete",
                "pauseReason": "c",
                "reason": "error",
                "viewable": 0
            } """
            { newstate = S.Buffering
            , oldstate = S.Complete
            , pauseReason = "c"
            , reason = S.Error
            , viewable = V.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Pause.Pause
fuzzer =
    Fuzz.map5 Pause.Pause
        S.fuzzer
        S.fuzzer
        Fuzz.string
        S.fuzzer
        V.fuzzer
