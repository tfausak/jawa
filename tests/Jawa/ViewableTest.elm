module Jawa.ViewableTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.Viewable
import Test


test : Test.Test
test =
    Test.describe "Jawa.Viewable"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Viewable.decoder Jawa.Viewable.encode fuzzer
        , Jawa.Extra.Test.testCodec "works with hidden"
            Jawa.Viewable.decoder
            Jawa.Viewable.encode
            "0"
            Jawa.Viewable.Hidden
        , Jawa.Extra.Test.testCodec "works with visible"
            Jawa.Viewable.decoder
            Jawa.Viewable.encode
            "1"
            Jawa.Viewable.Visible
        ]


fuzzer : Fuzz.Fuzzer Jawa.Viewable.Viewable
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.Viewable.Hidden
        , Jawa.Viewable.Visible
        ]
