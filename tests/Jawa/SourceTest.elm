module Jawa.SourceTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Source as S
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Source"
        [ TestExtra.fuzzCodec "round trips" S.decoder S.encoder fuzzer
        , TestExtra.testCodec "works"
            S.decoder
            S.encoder
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


fuzzer : Fuzz.Fuzzer S.Source
fuzzer =
    Fuzz.map4 S.Source
        Fuzz.bool
        Fuzz.string
        Fuzz.string
        Fuzz.string
