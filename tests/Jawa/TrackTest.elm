module Jawa.TrackTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Test.Extra
import Jawa.Track
import Jawa.TrackKind
import Jawa.TrackKindTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Track"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Track.decoder Jawa.Track.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
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
