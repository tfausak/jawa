module Jawa.TrackTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Test.Extra as TestExtra
import Jawa.Track as T
import Jawa.TrackKind as TK
import Jawa.TrackKindTest as TK
import Test


test : Test.Test
test =
    Test.describe "Jawa.Track"
        [ TestExtra.fuzzCodec "round trips" T.decoder T.encoder fuzzer
        , TestExtra.testCodec "works"
            T.decoder
            T.encoder
            """ {
                "file": "a",
                "kind": "captions",
                "label": "b"
            } """
            { file = "a"
            , kind = TK.Captions
            , label = "b"
            }
        ]


fuzzer : Fuzz.Fuzzer T.Track
fuzzer =
    Fuzz.map3 T.Track
        Fuzz.string
        TK.fuzzer
        Fuzz.string
