module Jawa.Event.RemoveTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Remove
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Remove"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Remove.decoder Jawa.Event.Remove.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Remove.decoder
            Jawa.Event.Remove.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Remove.Remove
fuzzer =
    Fuzz.constant {}
