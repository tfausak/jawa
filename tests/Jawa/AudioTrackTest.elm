module Jawa.AudioTrackTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.AudioTrack as AT
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.AudioTrack"
        [ TestExtra.fuzzCodec "round trips" AT.decoder AT.encoder fuzzer
        , TestExtra.testCodec "works"
            AT.decoder
            AT.encoder
            """ {
                "autoselect": false,
                "defaulttrack": true,
                "language": "a",
                "name": "b"
            } """
            { autoselect = False
            , defaulttrack = True
            , language = "a"
            , name = "b"
            }
        ]


fuzzer : Fuzz.Fuzzer AT.AudioTrack
fuzzer =
    Fuzz.map4 AT.AudioTrack
        Fuzz.bool
        Fuzz.bool
        Fuzz.string
        Fuzz.string
