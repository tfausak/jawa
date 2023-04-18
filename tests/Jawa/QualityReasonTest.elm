module Jawa.QualityReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.QualityReason as QR
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.QualityReason"
        [ TestExtra.fuzzCodec "round trips" QR.decoder QR.encoder fuzzer
        , TestExtra.testCodec "works with api"
            QR.decoder
            QR.encoder
            "\"api\""
            QR.Api
        , TestExtra.testCodec "works with auto"
            QR.decoder
            QR.encoder
            "\"auto\""
            QR.Auto
        , TestExtra.testCodec "works with initial choice"
            QR.decoder
            QR.encoder
            "\"initial choice\""
            QR.InitialChoice
        ]


fuzzer : Fuzz.Fuzzer QR.QualityReason
fuzzer =
    Fuzz.oneOfValues
        [ QR.Api
        , QR.Auto
        , QR.InitialChoice
        ]
