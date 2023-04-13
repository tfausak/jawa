module Jawa.Event.FirstFrameTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.FirstFrame as FirstFrame
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" FirstFrame.decoder FirstFrame.encoder fuzzer
        , TestExtra.testCodec "works"
            FirstFrame.decoder
            FirstFrame.encoder
            """ {
                "loadTime": 0.1
            } """
            { loadTime = 0.1
            }
        ]


fuzzer : Fuzz.Fuzzer FirstFrame.FirstFrame
fuzzer =
    Fuzz.map FirstFrame.FirstFrame
        Fuzz.niceFloat
