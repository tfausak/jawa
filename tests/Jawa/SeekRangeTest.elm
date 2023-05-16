module Jawa.SeekRangeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.SeekRange
import Test


test : Test.Test
test =
    Test.describe "Jawa.SeekRange"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.SeekRange.decoder Jawa.SeekRange.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.SeekRange.decoder
            Jawa.SeekRange.encoder
            """ {
                "end": 0.1,
                "start": 0.2
            } """
            { end = 0.1
            , start = 0.2
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.SeekRange.SeekRange
fuzzer =
    Fuzz.map2 Jawa.SeekRange.SeekRange
        Fuzz.niceFloat
        Fuzz.niceFloat
