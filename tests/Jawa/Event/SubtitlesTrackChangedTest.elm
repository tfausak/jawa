module Jawa.Event.SubtitlesTrackChangedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.SubtitlesTrackChanged
import Jawa.Extra.Test
import Jawa.SubtitleTrackTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.SubtitlesTrackChanged"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.SubtitlesTrackChanged.decoder Jawa.Event.SubtitlesTrackChanged.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.SubtitlesTrackChanged.decoder
            Jawa.Event.SubtitlesTrackChanged.encode
            """ {
                "currentTrack": 0,
                "tracks": []
            } """
            { currentTrack = 0
            , tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.SubtitlesTrackChanged.SubtitlesTrackChanged
fuzzer =
    Fuzz.map2 Jawa.Event.SubtitlesTrackChanged.SubtitlesTrackChanged
        Fuzz.int
        (Fuzz.listOfLengthBetween 0 2 Jawa.SubtitleTrackTest.fuzzer)
