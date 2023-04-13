module Jawa.MediaTypeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.MediaType as MT
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" MT.decoder MT.encoder fuzzer
        , TestExtra.testCodec "works with audio"
            MT.decoder
            MT.encoder
            "\"audio\""
            MT.Audio
        , TestExtra.testCodec "works with video"
            MT.decoder
            MT.encoder
            "\"video\""
            MT.Video
        ]


fuzzer : Fuzz.Fuzzer MT.MediaType
fuzzer =
    Fuzz.oneOfValues
        [ MT.Audio
        , MT.Video
        ]
