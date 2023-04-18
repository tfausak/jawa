module Jawa.Event.ClickTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Click as Click
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Click"
        [ TestExtra.fuzzCodec "round trips" Click.decoder Click.encoder fuzzer
        , TestExtra.testCodec "works"
            Click.decoder
            Click.encoder
            """ {
                "isTrusted": false
            } """
            { isTrusted = False
            }
        ]


fuzzer : Fuzz.Fuzzer Click.Click
fuzzer =
    Fuzz.map Click.Click
        Fuzz.bool
