module Jawa.Event.MuteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Mute
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Mute"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Mute.decoder Jawa.Event.Mute.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Mute.decoder
            Jawa.Event.Mute.encoder
            """ {
                "mute": false
            } """
            { mute = False
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Mute.Mute
fuzzer =
    Fuzz.map Jawa.Event.Mute.Mute
        Fuzz.bool
