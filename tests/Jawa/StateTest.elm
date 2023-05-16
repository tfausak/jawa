module Jawa.StateTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.State
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.State"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.State.decoder Jawa.State.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works with buffering"
            Jawa.State.decoder
            Jawa.State.encoder
            "\"buffering\""
            Jawa.State.Buffering
        , Jawa.Test.Extra.testCodec "works with complete"
            Jawa.State.decoder
            Jawa.State.encoder
            "\"complete\""
            Jawa.State.Complete
        , Jawa.Test.Extra.testCodec "works with error"
            Jawa.State.decoder
            Jawa.State.encoder
            "\"error\""
            Jawa.State.Error
        , Jawa.Test.Extra.testCodec "works with idle"
            Jawa.State.decoder
            Jawa.State.encoder
            "\"idle\""
            Jawa.State.Idle
        , Jawa.Test.Extra.testCodec "works with loading"
            Jawa.State.decoder
            Jawa.State.encoder
            "\"loading\""
            Jawa.State.Loading
        , Jawa.Test.Extra.testCodec "works with paused"
            Jawa.State.decoder
            Jawa.State.encoder
            "\"paused\""
            Jawa.State.Paused
        , Jawa.Test.Extra.testCodec "works with playing"
            Jawa.State.decoder
            Jawa.State.encoder
            "\"playing\""
            Jawa.State.Playing
        , Jawa.Test.Extra.testCodec "works with stalled"
            Jawa.State.decoder
            Jawa.State.encoder
            "\"stalled\""
            Jawa.State.Stalled
        ]


fuzzer : Fuzz.Fuzzer Jawa.State.State
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.State.Buffering
        , Jawa.State.Complete
        , Jawa.State.Error
        , Jawa.State.Idle
        , Jawa.State.Loading
        , Jawa.State.Paused
        , Jawa.State.Playing
        , Jawa.State.Stalled
        ]
