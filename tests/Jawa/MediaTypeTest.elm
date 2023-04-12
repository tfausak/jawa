module Jawa.MediaTypeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.MediaType as MediaType
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" MediaType.decoder MediaType.encoder fuzzer
        , TestExtra.testCodec "works with audio"
            MediaType.decoder
            MediaType.encoder
            "\"audio\""
            MediaType.Audio
        , TestExtra.testCodec "works with video"
            MediaType.decoder
            MediaType.encoder
            "\"video\""
            MediaType.Video
        ]


fuzzer : Fuzz.Fuzzer MediaType.MediaType
fuzzer =
    Fuzz.oneOf
        [ Fuzz.constant MediaType.Audio
        , Fuzz.constant MediaType.Video
        ]
