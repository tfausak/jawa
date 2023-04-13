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
    Test.concat
        [ TestExtra.fuzzCodec "round trips" PlaylistComplete.decoder PlaylistComplete.encoder fuzzer
        , TestExtra.testCodec "works"
            PlaylistComplete.decoder
            PlaylistComplete.encoder
            """ {
            } """
            PlaylistComplete.PlaylistComplete
        ]


fuzzer : Fuzz.Fuzzer PlaylistComplete.PlaylistComplete
fuzzer =
    Fuzz.constant PlaylistComplete.PlaylistComplete
