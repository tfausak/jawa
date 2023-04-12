module Jawa.Event.RemoveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Remove as Remove
import Jawa.TestHelper as TestHelper
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" Remove.decoder Remove.encoder fuzzer
        , TestHelper.testCodec "works"
            Remove.decoder
            Remove.encoder
            """ {
            } """
            Remove.Remove
        ]


fuzzer : Fuzz.Fuzzer Remove.Remove
fuzzer =
    Fuzz.constant Remove.Remove
