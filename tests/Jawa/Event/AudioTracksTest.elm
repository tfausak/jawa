module Jawa.Event.AudioTracksTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.AudioTrackTest
import Jawa.Event.AudioTracks
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.AudioTracks"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.AudioTracks.decoder Jawa.Event.AudioTracks.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.AudioTracks.decoder
            Jawa.Event.AudioTracks.encoder
            """ {
                "currentTrack": 0,
                "tracks": []
            } """
            { currentTrack = 0
            , tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.AudioTracks.AudioTracks
fuzzer =
    Fuzz.map2 Jawa.Event.AudioTracks.AudioTracks
        Fuzz.int
        (Fuzz.listOfLengthBetween 0 2 Jawa.AudioTrackTest.fuzzer)
