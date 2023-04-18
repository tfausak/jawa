module Jawa.Event.BufferFullTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BufferFull as BufferFull
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.BufferFull"
        [ TestExtra.fuzzCodec "round trips" BufferFull.decoder BufferFull.encoder fuzzer
        , TestExtra.testCodec "works"
            BufferFull.decoder
            BufferFull.encoder
            """ {
            } """
            BufferFull.BufferFull
        ]


fuzzer : Fuzz.Fuzzer BufferFull.BufferFull
fuzzer =
    Fuzz.constant BufferFull.BufferFull
