module Jawa.Event.PipEnterTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PipEnter
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PipEnter"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.PipEnter.decoder Jawa.Event.PipEnter.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.PipEnter.decoder
            Jawa.Event.PipEnter.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PipEnter.PipEnter
fuzzer =
    Fuzz.constant {}
