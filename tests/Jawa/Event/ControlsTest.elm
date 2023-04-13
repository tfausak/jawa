module Jawa.Event.ControlsTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Controls as Controls
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Controls.decoder Controls.encoder fuzzer
        , TestExtra.testCodec "works"
            Controls.decoder
            Controls.encoder
            """ {
                "controls": false
            } """
            { controls = False
            }
        ]


fuzzer : Fuzz.Fuzzer Controls.Controls
fuzzer =
    Fuzz.map Controls.Controls
        Fuzz.bool
