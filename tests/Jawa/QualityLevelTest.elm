module Jawa.QualityLevelTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.QualityLevel as QL
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.QualityLevel"
        [ TestExtra.fuzzCodec "round trips" QL.decoder QL.encoder fuzzer
        , TestExtra.testCodec "works"
            QL.decoder
            QL.encoder
            """ {
                "bitrate": 0,
                "height": 1,
                "index": 2,
                "label": "a",
                "width": 3
            } """
            { bitrate = 0
            , height = 1
            , index = 2
            , label = "a"
            , width = 3
            }
        ]


fuzzer : Fuzz.Fuzzer QL.QualityLevel
fuzzer =
    Fuzz.map5 QL.QualityLevel
        Fuzz.int
        Fuzz.int
        Fuzz.int
        Fuzz.string
        Fuzz.int
