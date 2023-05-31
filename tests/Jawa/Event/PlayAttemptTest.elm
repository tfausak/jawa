module Jawa.Event.PlayAttemptTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlayAttempt
import Jawa.Extra.Test
import Jawa.PlayReason
import Jawa.PlayReasonTest
import Jawa.PlaylistItemTest
import Jawa.Preload
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlayAttempt"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.PlayAttempt.decoder Jawa.Event.PlayAttempt.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.PlayAttempt.decoder
            Jawa.Event.PlayAttempt.encode
            """ {
                "item": {
                    "allSources": [],
                    "file": "a",
                    "preload": "none",
                    "sources": [],
                    "tracks": []
                },
                "playReason": "interaction"
            } """
            { item =
                { allSources = []
                , description = Nothing
                , file = "a"
                , image = Nothing
                , mediaId = Nothing
                , preload = Jawa.Preload.None
                , sources = []
                , title = Nothing
                , tracks = []
                }
            , playReason = Jawa.PlayReason.Interaction
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PlayAttempt.PlayAttempt
fuzzer =
    Fuzz.map2 Jawa.Event.PlayAttempt.PlayAttempt
        Jawa.PlaylistItemTest.fuzzer
        Jawa.PlayReasonTest.fuzzer
