module Jawa.Event.SeekTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Seek
import Jawa.Metadata
import Jawa.MetadataTest
import Jawa.SeekRangeTest
import Jawa.Test.Extra
import Json.Encode
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Seek"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Seek.decoder Jawa.Event.Seek.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Seek.decoder
            Jawa.Event.Seek.encoder
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
            , metadata = Jawa.Metadata.Metadata Json.Encode.null
            , offset = 0.3
            , position = 0.4
            , seekRange =
                { end = 0.5
                , start = 0.6
                }
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Seek.Seek
fuzzer =
    Fuzz.map6 Jawa.Event.Seek.Seek
        Fuzz.niceFloat
        Fuzz.niceFloat
        Jawa.MetadataTest.fuzzer
        Fuzz.niceFloat
        Fuzz.niceFloat
        Jawa.SeekRangeTest.fuzzer
