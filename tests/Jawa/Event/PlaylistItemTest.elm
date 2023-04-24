module Jawa.Event.PlaylistItemTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlaylistItem as PlaylistItem
import Jawa.PlaylistItemTest as PI
import Jawa.Preload as P
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlaylistItem"
        [ TestExtra.fuzzCodec "round trips" PlaylistItem.decoder PlaylistItem.encoder fuzzer
        , TestExtra.testCodec "works"
            PlaylistItem.decoder
            PlaylistItem.encoder
            """ {
                "index": 0,
                "item": {
                    "allSources": [],
                    "file": "a",
                    "preload": "auto",
                    "sources": [],
                    "tracks": []
                }
            } """
            { index = 0
            , item =
                { allSources = []
                , description = Nothing
                , file = "a"
                , image = Nothing
                , mediaId = Nothing
                , preload = P.Auto
                , sources = []
                , title = Nothing
                , tracks = []
                }
            }
        ]


fuzzer : Fuzz.Fuzzer PlaylistItem.PlaylistItem
fuzzer =
    Fuzz.map2 PlaylistItem.PlaylistItem
        Fuzz.int
        PI.fuzzer
