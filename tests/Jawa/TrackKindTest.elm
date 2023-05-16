module Jawa.TrackKindTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Test.Extra
import Jawa.TrackKind
import Test


test : Test.Test
test =
    Test.describe "Jawa.TrackKind"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.TrackKind.decoder Jawa.TrackKind.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works with captions"
            Jawa.TrackKind.decoder
            Jawa.TrackKind.encoder
            "\"captions\""
            Jawa.TrackKind.Captions
        , Jawa.Test.Extra.testCodec "works with chapters"
            Jawa.TrackKind.decoder
            Jawa.TrackKind.encoder
            "\"chapters\""
            Jawa.TrackKind.Chapters
        , Jawa.Test.Extra.testCodec "works with thumbnails"
            Jawa.TrackKind.decoder
            Jawa.TrackKind.encoder
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
