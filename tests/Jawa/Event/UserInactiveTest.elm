module Jawa.Event.UserInactiveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.UserInactive
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.UserInactive"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.UserInactive.decoder Jawa.Event.UserInactive.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.UserInactive.decoder
            Jawa.Event.UserInactive.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.UserInactive.UserInactive
fuzzer =
    Fuzz.constant {}
