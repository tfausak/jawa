module Jawa.Event.IdleTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Idle as Idle
import Jawa.State as S
import Jawa.StateTest as S
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Idle.decoder Idle.encoder fuzzer
        , TestExtra.testCodec "works"
            Idle.decoder
            Idle.encoder
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "reason": "error"
            } """
            { newstate = S.Buffering
            , oldstate = S.Complete
            , reason = S.Error
            }
        ]


fuzzer : Fuzz.Fuzzer Idle.Idle
fuzzer =
    Fuzz.map3 Idle.Idle
        S.fuzzer
        S.fuzzer
        S.fuzzer
