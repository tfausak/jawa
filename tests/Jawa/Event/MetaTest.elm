module Jawa.Event.MetaTest exposing (fuzzer, test)

import Fuzz
import Jawa.Event.Meta
import Jawa.Extra.Test
import Jawa.Metadata
import Jawa.MetadataTest
import Json.Encode
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Meta"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Meta.decoder Jawa.Event.Meta.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Meta.decoder
            Jawa.Event.Meta.encoder
            "null"
            (Jawa.Metadata.Metadata Json.Encode.null)
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Meta.Meta
fuzzer =
    Jawa.MetadataTest.fuzzer
