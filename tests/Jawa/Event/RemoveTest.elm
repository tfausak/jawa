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
    Test.describe "Jawa.Event.Remove"
        [ TestExtra.fuzzCodec "round trips" Remove.decoder Remove.encoder fuzzer
        , TestExtra.testCodec "works"
            Remove.decoder
            Remove.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Remove.Remove
fuzzer =
    Fuzz.constant {}
