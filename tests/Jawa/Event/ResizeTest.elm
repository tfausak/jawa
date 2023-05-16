module Jawa.Event.ResizeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Resize
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Resize"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Resize.decoder Jawa.Event.Resize.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Resize.decoder
            Jawa.Event.Resize.encoder
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
