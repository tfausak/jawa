module Jawa.Event.ViewableTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Viewable
import Jawa.Test.Extra
import Jawa.Viewable
import Jawa.ViewableTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Viewable"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Viewable.decoder Jawa.Event.Viewable.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Viewable.decoder
            Jawa.Event.Viewable.encoder
            """ {
                "viewable": 0
            } """
            { viewable = Jawa.Viewable.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Viewable.Viewable
fuzzer =
    Fuzz.map Jawa.Event.Viewable.Viewable
        Jawa.ViewableTest.fuzzer
