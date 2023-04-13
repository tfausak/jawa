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
    Test.concat
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
    Fuzz.oneOf
        [ Fuzz.constant S.Buffering
        , Fuzz.constant S.Complete
        , Fuzz.constant S.Error
        , Fuzz.constant S.Idle
        , Fuzz.constant S.Loading
        , Fuzz.constant S.Paused
        , Fuzz.constant S.Playing
        , Fuzz.constant S.Stalled
        ]
