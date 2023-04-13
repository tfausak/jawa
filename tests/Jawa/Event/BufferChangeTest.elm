module Jawa.Event.BufferChangeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BufferChange as BufferChange
import Jawa.SeekRangeTest as SR
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" BufferChange.decoder BufferChange.encoder fuzzer
        , TestExtra.testCodec "works"
            BufferChange.decoder
            BufferChange.encoder
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


fuzzer : Fuzz.Fuzzer BufferChange.BufferChange
fuzzer =
    Fuzz.map5 BufferChange.BufferChange
        Fuzz.niceFloat
        Fuzz.niceFloat
        Fuzz.niceFloat
        Fuzz.niceFloat
        SR.fuzzer
