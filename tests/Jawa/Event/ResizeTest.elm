module Jawa.Event.ResizeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Resize
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Resize"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Resize.decoder Jawa.Event.Resize.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Resize.decoder
            Jawa.Event.Resize.encode
            """ {
                "height": 0,
                "width": 1
            } """
            { height = 0
            , width = 1
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Resize.Resize
fuzzer =
    Fuzz.map2 Jawa.Event.Resize.Resize
        Fuzz.int
        Fuzz.int
