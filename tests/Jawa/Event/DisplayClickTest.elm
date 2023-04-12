module Jawa.Event.DisplayClickTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.TestHelper as TestHelper
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" DisplayClick.decoder DisplayClick.encoder fuzzer
        , TestHelper.testCodec "works"
            DisplayClick.decoder
            DisplayClick.encoder
            """ {
            } """
            DisplayClick.DisplayClick
        ]


fuzzer : Fuzz.Fuzzer DisplayClick.DisplayClick
fuzzer =
    Fuzz.constant DisplayClick.DisplayClick
