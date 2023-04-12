module Jawa.Event.ReadyTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Ready as Ready
import Jawa.TestHelper as TestHelper
import Jawa.Visibility as Visibility
import Jawa.VisibilityTest as VisibilityTest
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" Ready.decoder Ready.encoder fuzzer
        , TestHelper.testCodec "works"
            Ready.decoder
            Ready.encoder
            """ {
                "setupTime": 0.1,
                "viewable": 0
            } """
            { setupTime = 0.1
            , viewable = Visibility.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Ready.Ready
fuzzer =
    Fuzz.map2 Ready.Ready
        Fuzz.niceFloat
        VisibilityTest.fuzzer
