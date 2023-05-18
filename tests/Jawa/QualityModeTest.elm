module Jawa.QualityModeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.QualityMode
import Test


test : Test.Test
test =
    Test.describe "Jawa.QualityMode"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.QualityMode.decoder Jawa.QualityMode.encode fuzzer
        , Jawa.Extra.Test.testCodec "works with auto"
            Jawa.QualityMode.decoder
            Jawa.QualityMode.encode
            "\"auto\""
            Jawa.QualityMode.Auto
        , Jawa.Extra.Test.testCodec "works with manual"
            Jawa.QualityMode.decoder
            Jawa.QualityMode.encode
            "\"manual\""
            Jawa.QualityMode.Manual
        ]


fuzzer : Fuzz.Fuzzer Jawa.QualityMode.QualityMode
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.QualityMode.Auto
        , Jawa.QualityMode.Manual
        ]
