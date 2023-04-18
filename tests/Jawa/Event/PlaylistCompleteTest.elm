module Jawa.Event.PlaylistCompleteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlaylistComplete as PlaylistComplete
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlaylistComplete"
        [ TestExtra.fuzzCodec "round trips" PlaylistComplete.decoder PlaylistComplete.encoder fuzzer
        , TestExtra.testCodec "works"
            PlaylistComplete.decoder
            PlaylistComplete.encoder
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer PlaylistComplete.PlaylistComplete
fuzzer =
    Fuzz.constant {}
