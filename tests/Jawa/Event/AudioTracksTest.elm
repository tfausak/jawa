module Jawa.Event.AudioTracksTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.AudioTrackTest as AT
import Jawa.Event.AudioTracks as AudioTracks
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.AudioTracks"
        [ TestExtra.fuzzCodec "round trips" AudioTracks.decoder AudioTracks.encoder fuzzer
        , TestExtra.testCodec "works"
            AudioTracks.decoder
            AudioTracks.encoder
            """ {
                "currentTrack": 0,
                "tracks": []
            } """
            { currentTrack = 0
            , tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer AudioTracks.AudioTracks
fuzzer =
    Fuzz.map2 AudioTracks.AudioTracks
        Fuzz.int
        (Fuzz.listOfLengthBetween 0 2 AT.fuzzer)
