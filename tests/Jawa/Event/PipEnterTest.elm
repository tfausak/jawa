module Jawa.Event.PipEnterTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PipEnter
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PipEnter"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.PipEnter.decoder Jawa.Event.PipEnter.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.PipEnter.decoder
            Jawa.Event.PipEnter.encode
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PipEnter.PipEnter
fuzzer =
    Fuzz.constant {}
