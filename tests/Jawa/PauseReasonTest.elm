module Jawa.PauseReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.PauseReason
import Test


test : Test.Test
test =
    Test.describe "Jawa.PauseReason"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.PauseReason.decoder Jawa.PauseReason.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works with external"
            Jawa.PauseReason.decoder
            Jawa.PauseReason.encoder
            "\"external\""
            Jawa.PauseReason.External
        , Jawa.Extra.Test.testCodec "works with interaction"
            Jawa.PauseReason.decoder
            Jawa.PauseReason.encoder
            "\"interaction\""
            Jawa.PauseReason.Interaction
        , Jawa.Extra.Test.testCodec "works with viewable"
            Jawa.PauseReason.decoder
            Jawa.PauseReason.encoder
            "\"viewable\""
            Jawa.PauseReason.Viewable
        ]


fuzzer : Fuzz.Fuzzer Jawa.PauseReason.PauseReason
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.PauseReason.External
        , Jawa.PauseReason.Interaction
        , Jawa.PauseReason.Viewable
        ]
