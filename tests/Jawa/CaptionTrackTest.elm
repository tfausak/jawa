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
        , Jawa.Extra.Test.testCodec "works without language"
            Jawa.CaptionTrack.decoder
            Jawa.CaptionTrack.encoder
            """ {
                "id": "a",
                "label": "b"
            } """
            { id = "a"
            , label = "b"
            , language = Nothing
            }
        , Jawa.Extra.Test.testCodec "works with language"
            Jawa.CaptionTrack.decoder
            Jawa.CaptionTrack.encoder
            """ {
                "id": "a",
                "label": "b",
                "language": "c"
            } """
            { id = "a"
            , label = "b"
            , language = Just "c"
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.CaptionTrack.CaptionTrack
fuzzer =
    Fuzz.map3 Jawa.CaptionTrack.CaptionTrack
        Fuzz.string
        Fuzz.string
        (Fuzz.maybe Fuzz.string)
