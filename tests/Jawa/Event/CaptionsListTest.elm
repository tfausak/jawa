module Jawa.Event.CaptionsListTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.CaptionTrackTest
import Jawa.Event.CaptionsList
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.CaptionsList"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.CaptionsList.decoder Jawa.Event.CaptionsList.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.CaptionsList.decoder
            Jawa.Event.CaptionsList.encoder
            """ {
                "track": 0,
                "tracks": []
            } """
            { track = 0
            , tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.CaptionsList.CaptionsList
fuzzer =
    Fuzz.map2 Jawa.Event.CaptionsList.CaptionsList
        Fuzz.int
        (Fuzz.listOfLengthBetween 0 2 Jawa.CaptionTrackTest.fuzzer)
