module Jawa.QualityLevelTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.QualityLevel
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.QualityLevel"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.QualityLevel.decoder Jawa.QualityLevel.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.QualityLevel.decoder
            Jawa.QualityLevel.encoder
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
