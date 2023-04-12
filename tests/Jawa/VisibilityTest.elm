module Jawa.VisibilityTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.TestHelper as TestHelper
import Jawa.Visibility as Visibility
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" Visibility.decoder Visibility.encoder fuzzer
        , TestHelper.testCodec "works with hidden"
            Visibility.decoder
            Visibility.encoder
            "0"
            Visibility.Hidden
        , TestHelper.testCodec "works with visible"
            Visibility.decoder
            Visibility.encoder
            "1"
            Visibility.Visible
        ]


fuzzer : Fuzz.Fuzzer Visibility.Visibility
fuzzer =
    Fuzz.oneOf
        [ Fuzz.constant Visibility.Hidden
        , Fuzz.constant Visibility.Visible
        ]
