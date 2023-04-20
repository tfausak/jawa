module Jawa.TrackKindTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Test.Extra as TestExtra
import Jawa.TrackKind as TK
import Test


test : Test.Test
test =
    Test.describe "Jawa.TrackKind"
        [ TestExtra.fuzzCodec "round trips" TK.decoder TK.encoder fuzzer
        , TestExtra.testCodec "works with captions"
            TK.decoder
            TK.encoder
            "\"captions\""
            TK.Captions
        , TestExtra.testCodec "works with chapters"
            TK.decoder
            TK.encoder
            "\"chapters\""
            TK.Chapters
        , TestExtra.testCodec "works with thumbnails"
            TK.decoder
            TK.encoder
            "\"thumbnails\""
            TK.Thumbnails
        ]


fuzzer : Fuzz.Fuzzer TK.TrackKind
fuzzer =
    Fuzz.oneOfValues
        [ TK.Captions
        , TK.Chapters
        , TK.Thumbnails
        ]
