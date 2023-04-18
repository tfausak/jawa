module Jawa.Event.MediaTypeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.MediaType as MediaType
import Jawa.MediaType as MT
import Jawa.MediaTypeTest as MT
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.MediaType"
        [ TestExtra.fuzzCodec "round trips" MediaType.decoder MediaType.encoder fuzzer
        , TestExtra.testCodec "works"
            MediaType.decoder
            MediaType.encoder
            """ {
                "mediaType": "audio"
            } """
            { mediaType = MT.Audio
            }
        ]


fuzzer : Fuzz.Fuzzer MediaType.MediaType
fuzzer =
    Fuzz.map MediaType.MediaType
        MT.fuzzer
