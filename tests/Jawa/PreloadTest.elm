module Jawa.PreloadTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.Preload
import Test


test : Test.Test
test =
    Test.describe "Jawa.Preload"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Preload.decoder Jawa.Preload.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works with auto"
            Jawa.Preload.decoder
            Jawa.Preload.encoder
            "\"auto\""
            Jawa.Preload.Auto
        , Jawa.Extra.Test.testCodec "works with metadata"
            Jawa.Preload.decoder
            Jawa.Preload.encoder
            "\"metadata\""
            Jawa.Preload.Metadata
        , Jawa.Extra.Test.testCodec "works with none"
            Jawa.Preload.decoder
            Jawa.Preload.encoder
            "\"none\""
            Jawa.Preload.None
        ]


fuzzer : Fuzz.Fuzzer Jawa.Preload.Preload
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.Preload.Auto
        , Jawa.Preload.Metadata
        , Jawa.Preload.None
        ]
