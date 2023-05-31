module Jawa.SubtitleTrackTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.Metadata
import Jawa.MetadataTest
import Jawa.SubtitleTrack
import Json.Encode
import Test


test : Test.Test
test =
    Test.describe "Jawa.SubtitleTrack"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.SubtitleTrack.decoder Jawa.SubtitleTrack.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.SubtitleTrack.decoder
            Jawa.SubtitleTrack.encode
            """ {
                "data": [],
                "default": false,
                "_id": "a",
                "kind": "b",
                "label": "c",
                "name": "d",
                "subtitleTrack": {}
            } """
            { data = []
            , default = False
            , id = "a"
            , kind = Just "b"
            , label = "c"
            , name = "d"
            , subtitleTrack = Jawa.Metadata.Metadata (Json.Encode.object [])
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.SubtitleTrack.SubtitleTrack
fuzzer =
    Fuzz.map7 Jawa.SubtitleTrack.SubtitleTrack
        (Fuzz.list Jawa.MetadataTest.fuzzer)
        Fuzz.bool
        Fuzz.string
        (Fuzz.maybe Fuzz.string)
        Fuzz.string
        Fuzz.string
        Jawa.MetadataTest.fuzzer
