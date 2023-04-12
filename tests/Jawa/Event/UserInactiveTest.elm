module Jawa.Event.UserInactiveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.UserInactive as UserInactive
import Jawa.TestHelper as TestHelper
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" UserInactive.decoder UserInactive.encoder fuzzer
        , TestHelper.testCodec "works"
            UserInactive.decoder
            UserInactive.encoder
            """ {
            } """
            UserInactive.UserInactive
        ]


fuzzer : Fuzz.Fuzzer UserInactive.UserInactive
fuzzer =
    Fuzz.constant UserInactive.UserInactive
