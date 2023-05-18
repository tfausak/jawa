module Jawa.QualityLevelTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.QualityLevel
import Test


test : Test.Test
test =
    Test.describe "Jawa.QualityLevel"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.QualityLevel.decoder Jawa.QualityLevel.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.QualityLevel.decoder
            Jawa.QualityLevel.encode
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


fuzzer : Fuzz.Fuzzer Jawa.QualityLevel.QualityLevel
fuzzer =
    Fuzz.map5 Jawa.QualityLevel.QualityLevel
        Fuzz.int
        Fuzz.int
        Fuzz.int
        Fuzz.string
        Fuzz.int
