module Jawa.ViewableTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as Viewable
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Viewable.decoder Viewable.encoder fuzzer
        , TestExtra.testCodec "works with hidden"
            Viewable.decoder
            Viewable.encoder
            "0"
            Viewable.Hidden
        , TestExtra.testCodec "works with visible"
            Viewable.decoder
            Viewable.encoder
            "1"
            Viewable.Visible
        ]


fuzzer : Fuzz.Fuzzer Viewable.Viewable
fuzzer =
    Fuzz.oneOf
        [ Fuzz.constant Viewable.Hidden
        , Fuzz.constant Viewable.Visible
        ]
