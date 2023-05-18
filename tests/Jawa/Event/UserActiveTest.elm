module Jawa.Event.UserActiveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.UserActive
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.UserActive"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.UserActive.decoder Jawa.Event.UserActive.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.UserActive.decoder
            Jawa.Event.UserActive.encode
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.UserActive.UserActive
fuzzer =
    Fuzz.constant {}
