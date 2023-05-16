module Jawa.Event.PipLeaveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PipLeave
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PipLeave"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.PipLeave.decoder Jawa.Event.PipLeave.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.PipLeave.decoder
            Jawa.Event.PipLeave.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PipLeave.PipLeave
fuzzer =
    Fuzz.constant {}
