module Jawa.Event.FullscreenTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Fullscreen
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Fullscreen"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Fullscreen.decoder Jawa.Event.Fullscreen.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Fullscreen.decoder
            Jawa.Event.Fullscreen.encoder
            """ {
                "fullscreen": false
            } """
            { fullscreen = False
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Fullscreen.Fullscreen
fuzzer =
    Fuzz.map Jawa.Event.Fullscreen.Fullscreen
        Fuzz.bool
