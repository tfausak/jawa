module Jawa.StateTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.State
import Test


test : Test.Test
test =
    Test.describe "Jawa.State"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.State.decoder Jawa.State.encode fuzzer
        , Jawa.Extra.Test.testCodec "works with buffering"
            Jawa.State.decoder
            Jawa.State.encode
            "\"buffering\""
            Jawa.State.Buffering
        , Jawa.Extra.Test.testCodec "works with complete"
            Jawa.State.decoder
            Jawa.State.encode
            "\"complete\""
            Jawa.State.Complete
        , Jawa.Extra.Test.testCodec "works with error"
            Jawa.State.decoder
            Jawa.State.encode
            "\"error\""
            Jawa.State.Error
        , Jawa.Extra.Test.testCodec "works with idle"
            Jawa.State.decoder
            Jawa.State.encode
            "\"idle\""
            Jawa.State.Idle
        , Jawa.Extra.Test.testCodec "works with loading"
            Jawa.State.decoder
            Jawa.State.encode
            "\"loading\""
            Jawa.State.Loading
        , Jawa.Extra.Test.testCodec "works with paused"
            Jawa.State.decoder
            Jawa.State.encode
            "\"paused\""
            Jawa.State.Paused
        , Jawa.Extra.Test.testCodec "works with playing"
            Jawa.State.decoder
            Jawa.State.encode
            "\"playing\""
            Jawa.State.Playing
        , Jawa.Extra.Test.testCodec "works with stalled"
            Jawa.State.decoder
            Jawa.State.encode
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
