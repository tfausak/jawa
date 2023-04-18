module Jawa.Event.PipEnterTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PipEnter as PipEnter
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PipEnter"
        [ TestExtra.fuzzCodec "round trips" PipEnter.decoder PipEnter.encoder fuzzer
        , TestExtra.testCodec "works"
            PipEnter.decoder
            PipEnter.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer PipEnter.PipEnter
fuzzer =
    Fuzz.constant {}
