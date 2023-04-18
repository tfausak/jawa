module Jawa.Event.PipLeaveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PipLeave as PipLeave
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PipLeave"
        [ TestExtra.fuzzCodec "round trips" PipLeave.decoder PipLeave.encoder fuzzer
        , TestExtra.testCodec "works"
            PipLeave.decoder
            PipLeave.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer PipLeave.PipLeave
fuzzer =
    Fuzz.constant {}
