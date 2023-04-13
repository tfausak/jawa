module Jawa.Event.RemoveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Remove as Remove
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Remove.decoder Remove.encoder fuzzer
        , TestExtra.testCodec "works"
            Remove.decoder
            Remove.encoder
            """ {
            } """
            Remove.Remove
        ]


fuzzer : Fuzz.Fuzzer Remove.Remove
fuzzer =
    Fuzz.constant Remove.Remove
