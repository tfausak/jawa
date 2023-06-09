module Jawa.Event.SeekedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Seeked
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Seeked"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Seeked.decoder Jawa.Event.Seeked.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Seeked.decoder
            Jawa.Event.Seeked.encode
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Seeked.Seeked
fuzzer =
    Fuzz.constant {}
