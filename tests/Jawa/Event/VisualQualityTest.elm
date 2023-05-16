module Jawa.Event.VisualQualityTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.VisualQuality
import Jawa.Extra.Test
import Jawa.QualityLevelTest
import Jawa.QualityMode
import Jawa.QualityModeTest
import Jawa.QualityReason
import Jawa.QualityReasonTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.VisualQuality"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.VisualQuality.decoder Jawa.Event.VisualQuality.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.VisualQuality.decoder
            Jawa.Event.VisualQuality.encoder
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
            , mode = Jawa.QualityMode.Auto
            , reason = Jawa.QualityReason.Api
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.VisualQuality.VisualQuality
fuzzer =
    Fuzz.map3 Jawa.Event.VisualQuality.VisualQuality
        Jawa.QualityLevelTest.fuzzer
        Jawa.QualityModeTest.fuzzer
        Jawa.QualityReasonTest.fuzzer
