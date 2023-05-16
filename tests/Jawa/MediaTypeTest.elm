module Jawa.MediaTypeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.MediaType
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.MediaType"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.MediaType.decoder Jawa.MediaType.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works with audio"
            Jawa.MediaType.decoder
            Jawa.MediaType.encoder
            "\"audio\""
            Jawa.MediaType.Audio
        , Jawa.Test.Extra.testCodec "works with video"
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
