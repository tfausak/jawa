module Jawa.Event.SeekedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Seeked as Seeked
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Seeked.decoder Seeked.encoder fuzzer
        , TestExtra.testCodec "works"
            Seeked.decoder
            Seeked.encoder
            """ {
            } """
            Seeked.Seeked
        ]


fuzzer : Fuzz.Fuzzer Seeked.Seeked
fuzzer =
    Fuzz.constant Seeked.Seeked
