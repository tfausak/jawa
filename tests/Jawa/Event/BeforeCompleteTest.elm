module Jawa.Event.BeforeCompleteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BeforeComplete as BeforeComplete
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.BeforeComplete"
        [ TestExtra.fuzzCodec "round trips" BeforeComplete.decoder BeforeComplete.encoder fuzzer
        , TestExtra.testCodec "works"
            BeforeComplete.decoder
            BeforeComplete.encoder
            """ {
            } """
            BeforeComplete.BeforeComplete
        ]


fuzzer : Fuzz.Fuzzer BeforeComplete.BeforeComplete
fuzzer =
    Fuzz.constant BeforeComplete.BeforeComplete
