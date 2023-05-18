module Jawa.Event.UserInactiveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.UserInactive
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.UserInactive"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.UserInactive.decoder Jawa.Event.UserInactive.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.UserInactive.decoder
            Jawa.Event.UserInactive.encode
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.UserInactive.UserInactive
fuzzer =
    Fuzz.constant {}
