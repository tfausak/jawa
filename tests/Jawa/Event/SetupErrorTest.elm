module Jawa.Event.SetupErrorTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.SetupError as SetupError
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.SetupError"
        [ TestExtra.fuzzCodec "round trips" SetupError.decoder SetupError.encoder fuzzer
        , TestExtra.testCodec "works"
            SetupError.decoder
            SetupError.encoder
            """ {
                "code": 0,
                "message": ""
            } """
            { code = 0
            , message = ""
            }
        ]


fuzzer : Fuzz.Fuzzer SetupError.SetupError
fuzzer =
    Fuzz.map2 SetupError.SetupError
        Fuzz.int
        Fuzz.string
