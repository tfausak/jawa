module Jawa.Event.SeekedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Seeked as Seeked
import Jawa.TestHelper as TestHelper
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" Seeked.decoder Seeked.encoder fuzzer
        , TestHelper.testCodec "works"
            Seeked.decoder
            Seeked.encoder
            """ {
            } """
            Seeked.Seeked
        ]


fuzzer : Fuzz.Fuzzer Seeked.Seeked
fuzzer =
    Fuzz.constant Seeked.Seeked
