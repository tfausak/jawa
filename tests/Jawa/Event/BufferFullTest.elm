module Jawa.Event.BufferFullTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BufferFull
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.BufferFull"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.BufferFull.decoder Jawa.Event.BufferFull.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.BufferFull.decoder
            Jawa.Event.BufferFull.encode
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.BufferFull.BufferFull
fuzzer =
    Fuzz.constant {}
