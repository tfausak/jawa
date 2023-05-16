module Jawa.Event.FirstFrameTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.FirstFrame
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.FirstFrame"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.FirstFrame.decoder Jawa.Event.FirstFrame.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.FirstFrame.decoder
            Jawa.Event.FirstFrame.encoder
            """ {
                "loadTime": 0.1
            } """
            { loadTime = 0.1
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.FirstFrame.FirstFrame
fuzzer =
    Fuzz.map Jawa.Event.FirstFrame.FirstFrame
        Fuzz.niceFloat
