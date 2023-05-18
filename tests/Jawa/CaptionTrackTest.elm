module Jawa.CaptionTrackTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.CaptionTrack
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.CaptionTrack"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.CaptionTrack.decoder Jawa.CaptionTrack.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.CaptionTrack.decoder
            Jawa.CaptionTrack.encoder
            """ {
                "id": "a",
                "label": "b",
                "language": "c"
            } """
            { id = "a"
            , label = "b"
            , language = "c"
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.CaptionTrack.CaptionTrack
fuzzer =
    Fuzz.map3 Jawa.CaptionTrack.CaptionTrack
        Fuzz.string
        Fuzz.string
        Fuzz.string
