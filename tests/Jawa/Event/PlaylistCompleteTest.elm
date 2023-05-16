module Jawa.Event.PlaylistCompleteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlaylistComplete
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlaylistComplete"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.PlaylistComplete.decoder Jawa.Event.PlaylistComplete.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.PlaylistComplete.decoder
            Jawa.Event.PlaylistComplete.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PlaylistComplete.PlaylistComplete
fuzzer =
    Fuzz.constant {}
