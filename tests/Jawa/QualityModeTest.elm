module Jawa.QualityModeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.QualityMode
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.QualityMode"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.QualityMode.decoder Jawa.QualityMode.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works with auto"
            Jawa.QualityMode.decoder
            Jawa.QualityMode.encoder
            "\"auto\""
            Jawa.QualityMode.Auto
        , Jawa.Test.Extra.testCodec "works with manual"
            Jawa.QualityMode.decoder
            Jawa.QualityMode.encoder
            "\"manual\""
            Jawa.QualityMode.Manual
        ]


fuzzer : Fuzz.Fuzzer Jawa.QualityMode.QualityMode
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.QualityMode.Auto
        , Jawa.QualityMode.Manual
        ]
