module Jawa.QualityReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.QualityReason
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.QualityReason"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.QualityReason.decoder Jawa.QualityReason.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works with api"
            Jawa.QualityReason.decoder
            Jawa.QualityReason.encoder
            "\"api\""
            Jawa.QualityReason.Api
        , Jawa.Test.Extra.testCodec "works with auto"
            Jawa.QualityReason.decoder
            Jawa.QualityReason.encoder
            "\"auto\""
            Jawa.QualityReason.Auto
        , Jawa.Test.Extra.testCodec "works with initial choice"
            Jawa.QualityReason.decoder
            Jawa.QualityReason.encoder
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
