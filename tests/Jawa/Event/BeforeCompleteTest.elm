module Jawa.Event.BeforeCompleteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.BeforeComplete
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.BeforeComplete"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.BeforeComplete.decoder Jawa.Event.BeforeComplete.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.BeforeComplete.decoder
            Jawa.Event.BeforeComplete.encode
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.BeforeComplete.BeforeComplete
fuzzer =
    Fuzz.constant {}
