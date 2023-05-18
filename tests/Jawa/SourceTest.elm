module Jawa.SourceTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.Source
import Test


test : Test.Test
test =
    Test.describe "Jawa.Source"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Source.decoder Jawa.Source.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Source.decoder
            Jawa.Source.encode
            """ {
                "default": false,
                "file": "a",
                "label": "b",
                "type": "c"
            } """
            { default = False
            , file = "a"
            , label = "b"
            , type_ = "c"
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Source.Source
fuzzer =
    Fuzz.map4 Jawa.Source.Source
        Fuzz.bool
        Fuzz.string
        Fuzz.string
        Fuzz.string
