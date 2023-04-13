module Jawa.Event.MuteTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Mute as Mute
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Mute.decoder Mute.encoder fuzzer
        , TestExtra.testCodec "works"
            Mute.decoder
            Mute.encoder
            """ {
                "mute": false
            } """
            { mute = False
            }
        ]


fuzzer : Fuzz.Fuzzer Mute.Mute
fuzzer =
    Fuzz.map Mute.Mute
        Fuzz.bool
