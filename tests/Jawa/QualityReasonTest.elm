module Jawa.QualityReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.QualityReason
import Test


test : Test.Test
test =
    Test.describe "Jawa.QualityReason"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.QualityReason.decoder Jawa.QualityReason.encode fuzzer
        , Jawa.Extra.Test.testCodec "works with api"
            Jawa.QualityReason.decoder
            Jawa.QualityReason.encode
            "\"api\""
            Jawa.QualityReason.Api
        , Jawa.Extra.Test.testCodec "works with auto"
            Jawa.QualityReason.decoder
            Jawa.QualityReason.encode
            "\"auto\""
            Jawa.QualityReason.Auto
        , Jawa.Extra.Test.testCodec "works with initial choice"
            Jawa.QualityReason.decoder
            Jawa.QualityReason.encode
            "\"initial choice\""
            Jawa.QualityReason.InitialChoice
        ]


fuzzer : Fuzz.Fuzzer Jawa.QualityReason.QualityReason
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.QualityReason.Api
        , Jawa.QualityReason.Auto
        , Jawa.QualityReason.InitialChoice
        ]
