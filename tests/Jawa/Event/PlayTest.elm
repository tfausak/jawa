module Jawa.Event.PlayTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Play as Play
import Jawa.PlayReason as PlR
import Jawa.PlayReasonTest as PlR
import Jawa.State as S
import Jawa.StateTest as S
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as V
import Jawa.ViewableTest as V
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Play"
        [ TestExtra.fuzzCodec "round trips" Play.decoder Play.encoder fuzzer
        , TestExtra.testCodec "works"
            Play.decoder
            Play.encoder
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "playReason": "external",
                "reason": "error",
                "viewable": 0
            } """
            { newstate = S.Buffering
            , oldstate = S.Complete
            , playReason = PlR.External
            , reason = S.Error
            , viewable = V.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Play.Play
fuzzer =
    Fuzz.map5 Play.Play
        S.fuzzer
        S.fuzzer
        PlR.fuzzer
        S.fuzzer
        V.fuzzer
