module Jawa.Event.BufferFullTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BufferFull
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.BufferFull"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.BufferFull.decoder Jawa.Event.BufferFull.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.BufferFull.decoder
            Jawa.Event.BufferFull.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.BufferFull.BufferFull
fuzzer =
    Fuzz.constant {}
