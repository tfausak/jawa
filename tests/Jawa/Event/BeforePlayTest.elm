module Jawa.Event.BeforePlayTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BeforePlay
import Jawa.Extra.Test
import Jawa.PlayReason
import Jawa.PlayReasonTest
import Jawa.Viewable
import Jawa.ViewableTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.BeforePlay"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.BeforePlay.decoder Jawa.Event.BeforePlay.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.BeforePlay.decoder
            Jawa.Event.BeforePlay.encode
            """ {
                "playReason": "autostart",
                "viewable": 0
            } """
            { playReason = Jawa.PlayReason.Autostart
            , viewable = Jawa.Viewable.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.BeforePlay.BeforePlay
fuzzer =
    Fuzz.map2 Jawa.Event.BeforePlay.BeforePlay
        Jawa.PlayReasonTest.fuzzer
        Jawa.ViewableTest.fuzzer
