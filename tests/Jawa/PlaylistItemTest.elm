module Jawa.PlaylistItemTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.PlaylistItem as PI
import Jawa.Preload as P
import Jawa.PreloadTest as P
import Jawa.SourceTest as S
import Jawa.Test.Extra as TestExtra
import Jawa.TrackTest as T
import Test


test : Test.Test
test =
    Test.describe "Jawa.PlaylistItem"
        [ TestExtra.fuzzCodec "round trips" PI.decoder PI.encoder fuzzer
        , TestExtra.testCodec "works with missing fields"
            PI.decoder
            PI.encoder
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
            , preload = P.Auto
            , sources = []
            , title = Nothing
            , tracks = []
            }
        , TestExtra.testCodec "works with null fields"
            PI.decoder
            PI.encoder
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
            , preload = P.Auto
            , sources = []
            , title = Nothing
            , tracks = []
            }
        , TestExtra.testCodec "works with non-null fields"
            PI.decoder
            PI.encoder
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
            , preload = P.Auto
            , sources = []
            , title = Just "e"
            , tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer PI.PlaylistItem
fuzzer =
    Fuzz.constant PI.PlaylistItem
        |> Fuzz.andMap (Fuzz.listOfLengthBetween 0 2 S.fuzzer)
        |> Fuzz.andMap (Fuzz.maybe Fuzz.string)
        |> Fuzz.andMap Fuzz.string
        |> Fuzz.andMap (Fuzz.maybe Fuzz.string)
        |> Fuzz.andMap (Fuzz.maybe Fuzz.string)
        |> Fuzz.andMap P.fuzzer
        |> Fuzz.andMap (Fuzz.listOfLengthBetween 0 2 S.fuzzer)
        |> Fuzz.andMap (Fuzz.maybe Fuzz.string)
        |> Fuzz.andMap (Fuzz.listOfLengthBetween 0 2 T.fuzzer)
