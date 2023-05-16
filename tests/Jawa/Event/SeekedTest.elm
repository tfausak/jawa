module Jawa.Event.SeekedTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Seeked
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Seeked"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Seeked.decoder Jawa.Event.Seeked.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Seeked.decoder
            Jawa.Event.Seeked.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Seeked.Seeked
fuzzer =
    Fuzz.constant {}
