module Jawa.PauseReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.PauseReason as PaR
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" PaR.decoder PaR.encoder fuzzer
        , TestExtra.testCodec "works with external"
            PaR.decoder
            PaR.encoder
            "\"external\""
            PaR.External
        , TestExtra.testCodec "works with interaction"
            PaR.decoder
            PaR.encoder
            "\"interaction\""
            PaR.Interaction
        , TestExtra.testCodec "works with viewable"
            PaR.decoder
            PaR.encoder
            "\"viewable\""
            PaR.Viewable
        ]


fuzzer : Fuzz.Fuzzer PaR.PauseReason
fuzzer =
    Fuzz.oneOf
        [ Fuzz.constant PaR.External
        , Fuzz.constant PaR.Interaction
        , Fuzz.constant PaR.Viewable
        ]
