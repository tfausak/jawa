module Jawa.PreloadTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Preload as P
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Preload"
        [ TestExtra.fuzzCodec "round trips" P.decoder P.encoder fuzzer
        , TestExtra.testCodec "works with auto"
            P.decoder
            P.encoder
            "\"auto\""
            P.Auto
        , TestExtra.testCodec "works with metadata"
            P.decoder
            P.encoder
            "\"metadata\""
            P.Metadata
        , TestExtra.testCodec "works with none"
            P.decoder
            P.encoder
            "\"none\""
            P.None
        ]


fuzzer : Fuzz.Fuzzer P.Preload
fuzzer =
    Fuzz.oneOfValues
        [ P.Auto
        , P.Metadata
        , P.None
        ]
