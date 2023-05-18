module Jawa.Event.FullscreenTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Fullscreen
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Fullscreen"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Fullscreen.decoder Jawa.Event.Fullscreen.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Fullscreen.decoder
            Jawa.Event.Fullscreen.encode
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
