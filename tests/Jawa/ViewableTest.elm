module Jawa.ViewableTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Test.Extra
import Jawa.Viewable
import Test


test : Test.Test
test =
    Test.describe "Jawa.Viewable"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Viewable.decoder Jawa.Viewable.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works with hidden"
            Jawa.Viewable.decoder
            Jawa.Viewable.encoder
            "0"
            Jawa.Viewable.Hidden
        , Jawa.Test.Extra.testCodec "works with visible"
            Jawa.Viewable.decoder
            Jawa.Viewable.encoder
            "1"
            Jawa.Viewable.Visible
        ]


fuzzer : Fuzz.Fuzzer Jawa.Viewable.Viewable
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.Viewable.Hidden
        , Jawa.Viewable.Visible
        ]
