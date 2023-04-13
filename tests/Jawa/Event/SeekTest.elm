module Jawa.Event.SeekTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Seek as Seek
import Jawa.Metadata as M
import Jawa.MetadataTest as M
import Jawa.SeekRangeTest as SR
import Jawa.Test.Extra as TestExtra
import Json.Encode
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Seek.decoder Seek.encoder fuzzer
        , TestExtra.testCodec "works"
            Seek.decoder
            Seek.encoder
            """ {
                "currentTime": 0.1,
                "duration": 0.2,
                "metadata": null,
                "offset": 0.3,
                "position": 0.4,
                "seekRange": {
                    "end": 0.5,
                    "start": 0.6
                }
            } """
            { currentTime = 0.1
            , duration = 0.2
            , metadata = M.Metadata Json.Encode.null
            , offset = 0.3
            , position = 0.4
            , seekRange =
                { end = 0.5
                , start = 0.6
                }
            }
        ]


fuzzer : Fuzz.Fuzzer Seek.Seek
fuzzer =
    Fuzz.map6 Seek.Seek
        Fuzz.niceFloat
        Fuzz.niceFloat
        M.fuzzer
        Fuzz.niceFloat
        Fuzz.niceFloat
        SR.fuzzer
