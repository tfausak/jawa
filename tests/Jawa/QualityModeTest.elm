module Jawa.QualityModeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.QualityMode as QM
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" QM.decoder QM.encoder fuzzer
        , TestExtra.testCodec "works with auto"
            QM.decoder
            QM.encoder
            "\"auto\""
            QM.Auto
        , TestExtra.testCodec "works with manual"
            QM.decoder
            QM.encoder
            "\"manual\""
            QM.Manual
        ]


fuzzer : Fuzz.Fuzzer QM.QualityMode
fuzzer =
    Fuzz.oneOf
        [ Fuzz.constant QM.Auto
        , Fuzz.constant QM.Manual
        ]
