module Jawa.Event.VisualQualityTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.VisualQuality as VisualQuality
import Jawa.QualityLevelTest as QL
import Jawa.QualityMode as QM
import Jawa.QualityModeTest as QM
import Jawa.QualityReason as QR
import Jawa.QualityReasonTest as QR
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" VisualQuality.decoder VisualQuality.encoder fuzzer
        , TestExtra.testCodec "works"
            VisualQuality.decoder
            VisualQuality.encoder
            """ {
                "level": {
                    "bitrate": 0,
                    "height": 1,
                    "index": 2,
                    "label": "a",
                    "width": 3
                },
                "mode": "auto",
                "reason": "api"
            } """
            { level =
                { bitrate = 0
                , height = 1
                , index = 2
                , label = "a"
                , width = 3
                }
            , mode = QM.Auto
            , reason = QR.Api
            }
        ]


fuzzer : Fuzz.Fuzzer VisualQuality.VisualQuality
fuzzer =
    Fuzz.map3 VisualQuality.VisualQuality
        QL.fuzzer
        QM.fuzzer
        QR.fuzzer
