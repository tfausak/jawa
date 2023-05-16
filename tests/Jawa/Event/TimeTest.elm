module Jawa.Event.TimeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Time
import Jawa.Metadata
import Jawa.MetadataTest
import Jawa.SeekRangeTest
import Jawa.Test.Extra
import Jawa.Viewable
import Jawa.ViewableTest
import Json.Encode
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Time"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Time.decoder Jawa.Event.Time.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Time.decoder
            Jawa.Event.Time.encoder
            """ {
                "currentTime": 0.1,
                "duration": 0.2,
                "metadata": null,
                "position": 0.3,
                "seekRange": {
                    "end": 0.4,
                    "start": 0.5
                },
                "viewable": 0
            } """
            { currentTime = 0.1
            , duration = 0.2
            , metadata = Jawa.Metadata.Metadata Json.Encode.null
            , position = 0.3
            , seekRange =
                { end = 0.4
                , start = 0.5
                }
            , viewable = Jawa.Viewable.Hidden
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Time.Time
fuzzer =
    Fuzz.map6 Jawa.Event.Time.Time
        Fuzz.niceFloat
        Fuzz.niceFloat
        Jawa.MetadataTest.fuzzer
        Fuzz.niceFloat
        Jawa.SeekRangeTest.fuzzer
        Jawa.ViewableTest.fuzzer
