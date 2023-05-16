module Jawa.Event.PlaylistItemTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.PlaylistItem
import Jawa.PlaylistItemTest
import Jawa.Preload
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.PlaylistItem"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.PlaylistItem.decoder Jawa.Event.PlaylistItem.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.PlaylistItem.decoder
            Jawa.Event.PlaylistItem.encoder
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
                , preload = Jawa.Preload.Auto
                , sources = []
                , title = Nothing
                , tracks = []
                }
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.PlaylistItem.PlaylistItem
fuzzer =
    Fuzz.map2 Jawa.Event.PlaylistItem.PlaylistItem
        Fuzz.int
        Jawa.PlaylistItemTest.fuzzer
