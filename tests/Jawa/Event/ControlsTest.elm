module Jawa.Event.ControlsTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Controls
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Controls"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Controls.decoder Jawa.Event.Controls.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Controls.decoder
            Jawa.Event.Controls.encoder
            """ {
                "controls": false
            } """
            { controls = False
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Controls.Controls
fuzzer =
    Fuzz.map Jawa.Event.Controls.Controls
        Fuzz.bool
