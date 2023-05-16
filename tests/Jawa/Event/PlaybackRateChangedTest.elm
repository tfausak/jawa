module Jawa.Event.PlaybackRateChangedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlaybackRateChanged
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlaybackRateChanged"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.PlaybackRateChanged.decoder Jawa.Event.PlaybackRateChanged.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.PlaybackRateChanged.decoder
            Jawa.Event.PlaybackRateChanged.encoder
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
