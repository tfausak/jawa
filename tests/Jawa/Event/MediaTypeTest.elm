module Jawa.Event.MediaTypeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.MediaType
import Jawa.Extra.Test
import Jawa.MediaType
import Jawa.MediaTypeTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.MediaType"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.MediaType.decoder Jawa.Event.MediaType.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.MediaType.decoder
            Jawa.Event.MediaType.encode
            """ {
                "mediaType": "audio"
            } """
            { mediaType = Jawa.MediaType.Audio
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.MediaType.MediaType
fuzzer =
    Fuzz.map Jawa.Event.MediaType.MediaType
        Jawa.MediaTypeTest.fuzzer
