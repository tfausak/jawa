module Jawa.Event.ReadyTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Ready
import Jawa.Extra.Test
import Jawa.Viewable
import Jawa.ViewableTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Ready"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Ready.decoder Jawa.Event.Ready.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Ready.decoder
            Jawa.Event.Ready.encoder
            """ {
                "setupTime": 0.1,
                "viewable": 0
            } """
            { setupTime = 0.1
            , viewable = Jawa.Viewable.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Ready.Ready
fuzzer =
    Fuzz.map2 Jawa.Event.Ready.Ready
        Fuzz.niceFloat
        Jawa.ViewableTest.fuzzer
