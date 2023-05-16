module Jawa.TrackTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.Track
import Jawa.TrackKind
import Jawa.TrackKindTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Track"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Track.decoder Jawa.Track.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Track.decoder
            Jawa.Track.encoder
            """ {
                "file": "a",
                "kind": "captions",
                "label": "b"
            } """
            { file = "a"
            , kind = Jawa.TrackKind.Captions
            , label = "b"
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Track.Track
fuzzer =
    Fuzz.map3 Jawa.Track.Track
        Fuzz.string
        Jawa.TrackKindTest.fuzzer
        Fuzz.string
