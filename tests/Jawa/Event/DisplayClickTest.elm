module Jawa.Event.DisplayClickTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.DisplayClick
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.DisplayClick"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.DisplayClick.decoder Jawa.Event.DisplayClick.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.DisplayClick.decoder
            Jawa.Event.DisplayClick.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.DisplayClick.DisplayClick
fuzzer =
    Fuzz.constant {}
