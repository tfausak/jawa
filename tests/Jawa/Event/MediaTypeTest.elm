module Jawa.Event.MediaTypeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.MediaType
import Jawa.MediaType
import Jawa.MediaTypeTest
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.MediaType"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.MediaType.decoder Jawa.Event.MediaType.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.MediaType.decoder
            Jawa.Event.MediaType.encoder
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
