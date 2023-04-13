module Jawa.Event.ResizeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Resize as Resize
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Resize.decoder Resize.encoder fuzzer
        , TestExtra.testCodec "works"
            Resize.decoder
            Resize.encoder
            """ {
                "height": 0,
                "width": 1
            } """
            { height = 0
            , width = 1
            }
        ]


fuzzer : Fuzz.Fuzzer Resize.Resize
fuzzer =
    Fuzz.map2 Resize.Resize
        Fuzz.int
        Fuzz.int
