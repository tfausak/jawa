module Jawa.Event.VolumeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Volume
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Volume"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Volume.decoder Jawa.Event.Volume.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Volume.decoder
            Jawa.Event.Volume.encoder
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
