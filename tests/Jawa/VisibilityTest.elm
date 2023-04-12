module Jawa.VisibilityTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Test.Extra as TestExtra
import Jawa.Visibility as Visibility
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Visibility.decoder Visibility.encoder fuzzer
        , TestExtra.testCodec "works with hidden"
            Visibility.decoder
            Visibility.encoder
            "0"
            Visibility.Hidden
        , TestExtra.testCodec "works with visible"
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
