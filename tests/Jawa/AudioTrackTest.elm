module Jawa.AudioTrackTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.AudioTrack
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.AudioTrack"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.AudioTrack.decoder Jawa.AudioTrack.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.AudioTrack.decoder
            Jawa.AudioTrack.encode
            """ {
                "autoselect": false,
                "defaulttrack": true,
                "language": "a",
                "name": "b"
            } """
            { autoselect = False
            , defaulttrack = True
            , groupid = Nothing
            , hlsjsIndex = Nothing
            , language = "a"
            , name = "b"
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.AudioTrack.AudioTrack
fuzzer =
    Fuzz.map6 Jawa.AudioTrack.AudioTrack
        Fuzz.bool
        Fuzz.bool
        (Fuzz.maybe Fuzz.string)
        (Fuzz.maybe Fuzz.int)
        Fuzz.string
        Fuzz.string
