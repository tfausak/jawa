module Jawa.AudioTrackTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.AudioTrack
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.AudioTrack"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.AudioTrack.decoder Jawa.AudioTrack.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.AudioTrack.decoder
            Jawa.AudioTrack.encoder
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


fuzzer : Fuzz.Fuzzer Jawa.AudioTrack.AudioTrack
fuzzer =
    Fuzz.map4 Jawa.AudioTrack.AudioTrack
        Fuzz.bool
        Fuzz.bool
        Fuzz.string
        Fuzz.string
