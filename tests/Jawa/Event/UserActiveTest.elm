module Jawa.Event.UserActiveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.UserActive as UserActive
import Jawa.TestHelper as TestHelper
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" UserActive.decoder UserActive.encoder fuzzer
        , TestHelper.testCodec "works"
            UserActive.decoder
            UserActive.encoder
            """ {
            } """
            UserActive.UserActive
        ]


fuzzer : Fuzz.Fuzzer UserActive.UserActive
fuzzer =
    Fuzz.constant UserActive.UserActive
