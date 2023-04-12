module Jawa.Event.SetupErrorTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.SetupError as SetupError
import Jawa.TestHelper as TestHelper
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" SetupError.decoder SetupError.encoder fuzzer
        , TestHelper.testCodec "works"
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
