module Jawa.Event.BreakpointTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Breakpoint as Breakpoint
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Breakpoint"
        [ TestExtra.fuzzCodec "round trips" Breakpoint.decoder Breakpoint.encoder fuzzer
        , TestExtra.testCodec "works"
            Breakpoint.decoder
            Breakpoint.encoder
            """ {
                "breakpoint": 0
            } """
            { breakpoint = 0
            }
        ]


fuzzer : Fuzz.Fuzzer Breakpoint.Breakpoint
fuzzer =
    Fuzz.map Breakpoint.Breakpoint
        Fuzz.int
