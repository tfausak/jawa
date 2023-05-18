module Jawa.Event.CaptionsChangedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.CaptionTrackTest
import Jawa.Event.CaptionsChanged
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.CaptionsChanged"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.CaptionsChanged.decoder Jawa.Event.CaptionsChanged.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.CaptionsChanged.decoder
            Jawa.Event.CaptionsChanged.encoder
            """ {
                "track": 0,
                "tracks": []
            } """
            { track = 0
            , tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.CaptionsChanged.CaptionsChanged
fuzzer =
    Fuzz.map2 Jawa.Event.CaptionsChanged.CaptionsChanged
        Fuzz.int
        (Fuzz.listOfLengthBetween 0 2 Jawa.CaptionTrackTest.fuzzer)
