module Jawa.Event.PlaylistCompleteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlaylistComplete
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlaylistComplete"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.PlaylistComplete.decoder Jawa.Event.PlaylistComplete.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.PlaylistComplete.decoder
            Jawa.Event.PlaylistComplete.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PlaylistComplete.PlaylistComplete
fuzzer =
    Fuzz.constant {}
