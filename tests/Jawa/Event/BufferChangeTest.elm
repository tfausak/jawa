module Jawa.Event.BufferChangeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BufferChange
import Jawa.Extra.Test
import Jawa.SeekRangeTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.BufferChange"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.BufferChange.decoder Jawa.Event.BufferChange.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.BufferChange.decoder
            Jawa.Event.BufferChange.encoder
            """ {
                "bufferPercent": 0.1,
                "currentTime": 0.2,
                "duration": 0.3,
                "position": 0.4,
                "seekRange": {
                    "end": 0.5,
                    "start": 0.6
                }
            } """
            { bufferPercent = 0.1
            , currentTime = 0.2
            , duration = 0.3
            , position = 0.4
            , seekRange =
                { end = 0.5
                , start = 0.6
                }
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.BufferChange.BufferChange
fuzzer =
    Fuzz.map5 Jawa.Event.BufferChange.BufferChange
        Fuzz.niceFloat
        Fuzz.niceFloat
        Fuzz.niceFloat
        Fuzz.niceFloat
        Jawa.SeekRangeTest.fuzzer
