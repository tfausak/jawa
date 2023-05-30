module Jawa.Event.LevelsChangedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.LevelsChanged
import Jawa.Extra.Test
import Jawa.QualityLevelTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.LevelsChanged"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.LevelsChanged.decoder Jawa.Event.LevelsChanged.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.LevelsChanged.decoder
            Jawa.Event.LevelsChanged.encode
            """ {
                "currentQuality": 0,
                "levels": []
            } """
            { currentQuality = 0
            , levels = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.LevelsChanged.LevelsChanged
fuzzer =
    Fuzz.map2 Jawa.Event.LevelsChanged.LevelsChanged
        Fuzz.int
        (Fuzz.listOfLengthBetween 0 2 Jawa.QualityLevelTest.fuzzer)
