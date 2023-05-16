module Jawa.Event.DisplayClickTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.DisplayClick
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.DisplayClick"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.DisplayClick.decoder Jawa.Event.DisplayClick.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.DisplayClick.decoder
            Jawa.Event.DisplayClick.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.DisplayClick.DisplayClick
fuzzer =
    Fuzz.constant {}
