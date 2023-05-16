module Jawa.PlaylistItemTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.PlaylistItem
import Jawa.Preload
import Jawa.PreloadTest
import Jawa.SourceTest
import Jawa.TrackTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.PlaylistItem"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.PlaylistItem.decoder Jawa.PlaylistItem.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works with missing fields"
            Jawa.PlaylistItem.decoder
            Jawa.PlaylistItem.encoder
            """ {
                "allSources": [],
                "file": "a",
                "preload": "auto",
                "sources": [],
                "tracks": []
            } """
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
        , Jawa.Extra.Test.testCodec "works with null fields"
            Jawa.PlaylistItem.decoder
            Jawa.PlaylistItem.encoder
            """ {
                "allSources": [],
                "description": null,
                "file": "a",
                "image": null,
                "mediaId": null,
                "preload": "auto",
                "sources": [],
                "title": null,
                "tracks": []
            } """
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
        , Jawa.Extra.Test.testCodec "works with non-null fields"
            Jawa.PlaylistItem.decoder
            Jawa.PlaylistItem.encoder
            """ {
                "allSources": [],
                "description": "a",
                "file": "b",
                "image": "c",
                "mediaId": "d",
                "preload": "auto",
                "sources": [],
                "title": "e",
                "tracks": []
            } """
            { allSources = []
            , description = Just "a"
            , file = "b"
            , image = Just "c"
            , mediaId = Just "d"
            , preload = Jawa.Preload.Auto
            , sources = []
            , title = Just "e"
            , tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.PlaylistItem.PlaylistItem
fuzzer =
    Fuzz.constant Jawa.PlaylistItem.PlaylistItem
        |> Fuzz.andMap (Fuzz.listOfLengthBetween 0 2 Jawa.SourceTest.fuzzer)
        |> Fuzz.andMap (Fuzz.maybe Fuzz.string)
        |> Fuzz.andMap Fuzz.string
        |> Fuzz.andMap (Fuzz.maybe Fuzz.string)
        |> Fuzz.andMap (Fuzz.maybe Fuzz.string)
        |> Fuzz.andMap Jawa.PreloadTest.fuzzer
        |> Fuzz.andMap (Fuzz.listOfLengthBetween 0 2 Jawa.SourceTest.fuzzer)
        |> Fuzz.andMap (Fuzz.maybe Fuzz.string)
        |> Fuzz.andMap (Fuzz.listOfLengthBetween 0 2 Jawa.TrackTest.fuzzer)
