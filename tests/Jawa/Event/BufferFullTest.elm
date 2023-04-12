module Jawa.Event.BufferFullTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BufferFull as BufferFull
import Jawa.TestHelper as TestHelper
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" BufferFull.decoder BufferFull.encoder fuzzer
        , TestHelper.testCodec "works"
            BufferFull.decoder
            BufferFull.encoder
            """ {
            } """
            BufferFull.BufferFull
        ]


fuzzer : Fuzz.Fuzzer BufferFull.BufferFull
fuzzer =
    Fuzz.constant BufferFull.BufferFull
