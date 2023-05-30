module Jawa.Event.LevelsTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Levels
import Jawa.Extra.Test
import Jawa.QualityLevelTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Levels"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Levels.decoder Jawa.Event.Levels.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Levels.decoder
            Jawa.Event.Levels.encode
            """ {
                "currentQuality": 0,
                "levels": []
            } """
            { currentQuality = 0
            , levels = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Levels.Levels
fuzzer =
    Fuzz.map2 Jawa.Event.Levels.Levels
        Fuzz.int
        (Fuzz.listOfLengthBetween 0 2 Jawa.QualityLevelTest.fuzzer)
