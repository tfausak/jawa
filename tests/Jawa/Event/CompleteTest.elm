module Jawa.Event.CompleteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Complete as Complete
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Complete"
        [ TestExtra.fuzzCodec "round trips" Complete.decoder Complete.encoder fuzzer
        , TestExtra.testCodec "works"
            Complete.decoder
            Complete.encoder
            """ {
            } """
            Complete.Complete
        ]


fuzzer : Fuzz.Fuzzer Complete.Complete
fuzzer =
    Fuzz.constant Complete.Complete
