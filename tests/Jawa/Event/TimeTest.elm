module Jawa.Event.TimeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Time as Time
import Jawa.SeekRangeTest as SR
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as V
import Jawa.ViewableTest as V
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Time.decoder Time.encoder fuzzer
        , TestExtra.testCodec "works"
            Time.decoder
            Time.encoder
            """ {
                "currentTime": 0.1,
                "duration": 0.2,
                "position": 0.3,
                "seekRange": {
                    "end": 0.4,
                    "start": 0.5
                },
                "viewable": 0
            } """
            { currentTime = 0.1
            , duration = 0.2
            , position = 0.3
            , seekRange =
                { end = 0.4
                , start = 0.5
                }
            , viewable = V.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Time.Time
fuzzer =
    Fuzz.map5 Time.Time
        Fuzz.niceFloat
        Fuzz.niceFloat
        Fuzz.niceFloat
        SR.fuzzer
        V.fuzzer
