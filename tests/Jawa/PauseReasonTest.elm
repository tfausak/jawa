module Jawa.PauseReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.PauseReason as PR
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" PR.decoder PR.encoder fuzzer
        , TestExtra.testCodec "works with external"
            PR.decoder
            PR.encoder
            "\"external\""
            PR.External
        , TestExtra.testCodec "works with interaction"
            PR.decoder
            PR.encoder
            "\"interaction\""
            PR.Interaction
        , TestExtra.testCodec "works with viewable"
            PR.decoder
            PR.encoder
            "\"viewable\""
            PR.Viewable
        ]


fuzzer : Fuzz.Fuzzer PR.PauseReason
fuzzer =
    Fuzz.oneOf
        [ Fuzz.constant PR.External
        , Fuzz.constant PR.Interaction
        , Fuzz.constant PR.Viewable
        ]
