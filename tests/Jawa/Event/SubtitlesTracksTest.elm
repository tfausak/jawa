module Jawa.Event.SubtitlesTracksTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.SubtitlesTracks
import Jawa.Extra.Test
import Jawa.SubtitleTrackTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.SubtitlesTracks"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.SubtitlesTracks.decoder Jawa.Event.SubtitlesTracks.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.SubtitlesTracks.decoder
            Jawa.Event.SubtitlesTracks.encode
            """ {
                "tracks": []
            } """
            { tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.SubtitlesTracks.SubtitlesTracks
fuzzer =
    Fuzz.map Jawa.Event.SubtitlesTracks.SubtitlesTracks
        (Fuzz.listOfLengthBetween 0 2 Jawa.SubtitleTrackTest.fuzzer)
