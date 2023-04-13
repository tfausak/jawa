module Jawa.Event.PlaybackRateChangedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlaybackRateChanged as PlaybackRateChanged
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" PlaybackRateChanged.decoder PlaybackRateChanged.encoder fuzzer
        , TestExtra.testCodec "works"
            PlaybackRateChanged.decoder
            PlaybackRateChanged.encoder
            """ {
                "playbackRate": 0.1
            } """
            { playbackRate = 0.1
            }
        ]


fuzzer : Fuzz.Fuzzer PlaybackRateChanged.PlaybackRateChanged
fuzzer =
    Fuzz.map PlaybackRateChanged.PlaybackRateChanged
        Fuzz.niceFloat
