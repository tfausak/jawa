module Jawa.Event.PipLeaveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PipLeave
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PipLeave"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.PipLeave.decoder Jawa.Event.PipLeave.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.PipLeave.decoder
            Jawa.Event.PipLeave.encode
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PipLeave.PipLeave
fuzzer =
    Fuzz.constant {}
