module Jawa.Event.PlaybackRateChangedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlaybackRateChanged
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlaybackRateChanged"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.PlaybackRateChanged.decoder Jawa.Event.PlaybackRateChanged.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.PlaybackRateChanged.decoder
            Jawa.Event.PlaybackRateChanged.encode
            """ {
                "playbackRate": 0.1
            } """
            { playbackRate = 0.1
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PlaybackRateChanged.PlaybackRateChanged
fuzzer =
    Fuzz.map Jawa.Event.PlaybackRateChanged.PlaybackRateChanged
        Fuzz.niceFloat
