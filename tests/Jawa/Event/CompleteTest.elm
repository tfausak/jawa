module Jawa.Event.CompleteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Complete
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Complete"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Complete.decoder Jawa.Event.Complete.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Complete.decoder
            Jawa.Event.Complete.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Complete.Complete
fuzzer =
    Fuzz.constant {}
