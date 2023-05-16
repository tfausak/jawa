module Jawa.Event.BreakpointTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Breakpoint
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Breakpoint"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Breakpoint.decoder Jawa.Event.Breakpoint.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Breakpoint.decoder
            Jawa.Event.Breakpoint.encoder
            """ {
                "breakpoint": 0
            } """
            { breakpoint = 0
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Breakpoint.Breakpoint
fuzzer =
    Fuzz.map Jawa.Event.Breakpoint.Breakpoint
        Fuzz.int
