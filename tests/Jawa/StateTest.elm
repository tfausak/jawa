module Jawa.StateTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.State as S
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.State"
        [ TestExtra.fuzzCodec "round trips" S.decoder S.encoder fuzzer
        , TestExtra.testCodec "works with buffering"
            S.decoder
            S.encoder
            "\"buffering\""
            S.Buffering
        , TestExtra.testCodec "works with complete"
            S.decoder
            S.encoder
            "\"complete\""
            S.Complete
        , TestExtra.testCodec "works with error"
            S.decoder
            S.encoder
            "\"error\""
            S.Error
        , TestExtra.testCodec "works with idle"
            S.decoder
            S.encoder
            "\"idle\""
            S.Idle
        , TestExtra.testCodec "works with loading"
            S.decoder
            S.encoder
            "\"loading\""
            S.Loading
        , TestExtra.testCodec "works with paused"
            S.decoder
            S.encoder
            "\"paused\""
            S.Paused
        , TestExtra.testCodec "works with playing"
            S.decoder
            S.encoder
            "\"playing\""
            S.Playing
        , TestExtra.testCodec "works with stalled"
            S.decoder
            S.encoder
            "\"stalled\""
            S.Stalled
        ]


fuzzer : Fuzz.Fuzzer S.State
fuzzer =
    Fuzz.oneOfValues
        [ S.Buffering
        , S.Complete
        , S.Error
        , S.Idle
        , S.Loading
        , S.Paused
        , S.Playing
        , S.Stalled
        ]
