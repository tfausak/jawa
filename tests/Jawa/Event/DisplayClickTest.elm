module Jawa.Event.DisplayClickTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" DisplayClick.decoder DisplayClick.encoder fuzzer
        , TestExtra.testCodec "works"
            DisplayClick.decoder
            DisplayClick.encoder
            """ {
            } """
            DisplayClick.DisplayClick
        ]


fuzzer : Fuzz.Fuzzer DisplayClick.DisplayClick
fuzzer =
    Fuzz.constant DisplayClick.DisplayClick
