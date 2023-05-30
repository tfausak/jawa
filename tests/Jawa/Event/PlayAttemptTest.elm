module Jawa.Event.PlayAttemptTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlayAttempt
import Jawa.Extra.Test
import Jawa.PlayReason
import Jawa.PlayReasonTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlayAttempt"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.PlayAttempt.decoder Jawa.Event.PlayAttempt.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.PlayAttempt.decoder
            Jawa.Event.PlayAttempt.encode
            """ {
                "playReason": "interaction"
            } """
            { playReason = Jawa.PlayReason.Interaction
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PlayAttempt.PlayAttempt
fuzzer =
    Fuzz.map Jawa.Event.PlayAttempt.PlayAttempt
        Jawa.PlayReasonTest.fuzzer
