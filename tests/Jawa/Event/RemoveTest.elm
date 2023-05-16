module Jawa.Event.RemoveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Remove
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Remove"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Remove.decoder Jawa.Event.Remove.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Remove.decoder
            Jawa.Event.Remove.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Remove.Remove
fuzzer =
    Fuzz.constant {}
