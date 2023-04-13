module Jawa.Event.FullscreenTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Fullscreen as Fullscreen
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Fullscreen.decoder Fullscreen.encoder fuzzer
        , TestExtra.testCodec "works"
            Fullscreen.decoder
            Fullscreen.encoder
            """ {
                "fullscreen": false
            } """
            { fullscreen = False
            }
        ]


fuzzer : Fuzz.Fuzzer Fullscreen.Fullscreen
fuzzer =
    Fuzz.map Fullscreen.Fullscreen
        Fuzz.bool
