module Jawa.ViewableTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as V
import Test


test : Test.Test
test =
    Test.describe "Jawa.Viewable"
        [ TestExtra.fuzzCodec "round trips" V.decoder V.encoder fuzzer
        , TestExtra.testCodec "works with hidden"
            V.decoder
            V.encoder
            "0"
            V.Hidden
        , TestExtra.testCodec "works with visible"
            V.decoder
            V.encoder
            "1"
            V.Visible
        ]


fuzzer : Fuzz.Fuzzer V.Viewable
fuzzer =
    Fuzz.oneOfValues
        [ V.Hidden
        , V.Visible
        ]
