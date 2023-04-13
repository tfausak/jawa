module Jawa.Event.ViewableTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Viewable as Viewable
import Jawa.Viewable as V
import Jawa.ViewableTest as V
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Viewable.decoder Viewable.encoder fuzzer
        , TestExtra.testCodec "works"
            Viewable.decoder
            Viewable.encoder
            """ {
                "viewable": 0
            } """
            { viewable = V.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Viewable.Viewable
fuzzer =
    Fuzz.map Viewable.Viewable
        V.fuzzer
