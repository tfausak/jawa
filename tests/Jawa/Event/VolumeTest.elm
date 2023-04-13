module Jawa.Event.VolumeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Volume as Volume
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Volume.decoder Volume.encoder fuzzer
        , TestExtra.testCodec "works"
            Volume.decoder
            Volume.encoder
            """ {
                "volume": 0.1
            } """
            { volume = 0.1
            }
        ]


fuzzer : Fuzz.Fuzzer Volume.Volume
fuzzer =
    Fuzz.map Volume.Volume
        Fuzz.niceFloat
