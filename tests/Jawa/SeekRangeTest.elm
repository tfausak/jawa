module Jawa.SeekRangeTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.SeekRange as SR
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" SR.decoder SR.encoder fuzzer
        , TestExtra.testCodec "works"
            SR.decoder
            SR.encoder
            """ {
                "end": 0.1,
                "start": 0.2
            } """
            { end = 0.1
            , start = 0.2
            }
        ]


fuzzer : Fuzz.Fuzzer SR.SeekRange
fuzzer =
    Fuzz.map2 SR.SeekRange
        Fuzz.niceFloat
        Fuzz.niceFloat
