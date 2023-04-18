module Jawa.Event.UserInactiveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.UserInactive as UserInactive
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.UserInactive"
        [ TestExtra.fuzzCodec "round trips" UserInactive.decoder UserInactive.encoder fuzzer
        , TestExtra.testCodec "works"
            UserInactive.decoder
            UserInactive.encoder
            """ {
            } """
            UserInactive.UserInactive
        ]


fuzzer : Fuzz.Fuzzer UserInactive.UserInactive
fuzzer =
    Fuzz.constant UserInactive.UserInactive
