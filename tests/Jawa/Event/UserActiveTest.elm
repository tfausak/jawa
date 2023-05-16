module Jawa.Event.UserActiveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.UserActive
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.UserActive"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.UserActive.decoder Jawa.Event.UserActive.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.UserActive.decoder
            Jawa.Event.UserActive.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.UserActive.UserActive
fuzzer =
    Fuzz.constant {}
