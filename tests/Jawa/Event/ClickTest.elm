module Jawa.Event.ClickTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Click
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Click"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Click.decoder Jawa.Event.Click.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Click.decoder
            Jawa.Event.Click.encoder
            """ {
                "isTrusted": false
            } """
            { isTrusted = False
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Click.Click
fuzzer =
    Fuzz.map Jawa.Event.Click.Click
        Fuzz.bool
