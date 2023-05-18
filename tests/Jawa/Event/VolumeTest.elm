module Jawa.Event.VolumeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Volume
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Volume"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Volume.decoder Jawa.Event.Volume.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Volume.decoder
            Jawa.Event.Volume.encode
            """ {
                "volume": 0.1
            } """
            { volume = 0.1
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Volume.Volume
fuzzer =
    Fuzz.map Jawa.Event.Volume.Volume
        Fuzz.niceFloat
