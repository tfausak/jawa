module Jawa.MediaTypeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.MediaType
import Test


test : Test.Test
test =
    Test.describe "Jawa.MediaType"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.MediaType.decoder Jawa.MediaType.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works with audio"
            Jawa.MediaType.decoder
            Jawa.MediaType.encoder
            "\"audio\""
            Jawa.MediaType.Audio
        , Jawa.Extra.Test.testCodec "works with video"
            Jawa.MediaType.decoder
            Jawa.MediaType.encoder
            "\"video\""
            Jawa.MediaType.Video
        ]


fuzzer : Fuzz.Fuzzer Jawa.MediaType.MediaType
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.MediaType.Audio
        , Jawa.MediaType.Video
        ]
