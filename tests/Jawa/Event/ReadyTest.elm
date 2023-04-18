module Jawa.Event.ReadyTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Ready as Ready
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as V
import Jawa.ViewableTest as V
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Ready"
        [ TestExtra.fuzzCodec "round trips" Ready.decoder Ready.encoder fuzzer
        , TestExtra.testCodec "works"
            Ready.decoder
            Ready.encoder
            """ {
                "setupTime": 0.1,
                "viewable": 0
            } """
            { setupTime = 0.1
            , viewable = V.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Ready.Ready
fuzzer =
    Fuzz.map2 Ready.Ready
        Fuzz.niceFloat
        V.fuzzer
