module Jawa.Event.MediaTypeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.MediaType as MediaType
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" MediaType.decoder MediaType.encoder fuzzer
        , TestExtra.testCodec "works"
            MediaType.decoder
            MediaType.encoder
            """ {
                "mediaType": ""
            } """
            { mediaType = ""
            }
        ]


fuzzer : Fuzz.Fuzzer MediaType.MediaType
fuzzer =
    Fuzz.map MediaType.MediaType
        Fuzz.string
