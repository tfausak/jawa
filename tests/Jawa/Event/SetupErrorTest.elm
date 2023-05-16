module Jawa.Event.SetupErrorTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.SetupError
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.SetupError"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.SetupError.decoder Jawa.Event.SetupError.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.SetupError.decoder
            Jawa.Event.SetupError.encoder
            """ {
                "code": 0,
                "message": ""
            } """
            { code = 0
            , message = ""
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.SetupError.SetupError
fuzzer =
    Fuzz.map2 Jawa.Event.SetupError.SetupError
        Fuzz.int
        Fuzz.string
