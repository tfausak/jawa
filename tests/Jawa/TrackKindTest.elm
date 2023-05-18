module Jawa.TrackKindTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.TrackKind
import Test


test : Test.Test
test =
    Test.describe "Jawa.TrackKind"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.TrackKind.decoder Jawa.TrackKind.encode fuzzer
        , Jawa.Extra.Test.testCodec "works with captions"
            Jawa.TrackKind.decoder
            Jawa.TrackKind.encode
            "\"captions\""
            Jawa.TrackKind.Captions
        , Jawa.Extra.Test.testCodec "works with chapters"
            Jawa.TrackKind.decoder
            Jawa.TrackKind.encode
            "\"chapters\""
            Jawa.TrackKind.Chapters
        , Jawa.Extra.Test.testCodec "works with thumbnails"
            Jawa.TrackKind.decoder
            Jawa.TrackKind.encode
            "\"thumbnails\""
            Jawa.TrackKind.Thumbnails
        ]


fuzzer : Fuzz.Fuzzer Jawa.TrackKind.TrackKind
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.TrackKind.Captions
        , Jawa.TrackKind.Chapters
        , Jawa.TrackKind.Thumbnails
        ]
