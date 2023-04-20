module Jawa.PlaylistItemTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.PlaylistItem as PI
import Jawa.Preload as P
import Jawa.PreloadTest as P
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
                "file": "a",
                "preload": "auto",
                "tracks": []
            } """
            { description = Nothing
            , file = "a"
            , image = Nothing
            , mediaId = Nothing
            , preload = P.Auto
            , title = Nothing
            , tracks = []
            }
        , TestExtra.testCodec "works with null fields"
            PI.decoder
            PI.encoder
            """ {
                "description": null,
                "file": "a",
                "image": null,
                "mediaId": null,
                "preload": "auto",
                "title": null,
                "tracks": []
            } """
            { description = Nothing
            , file = "a"
            , image = Nothing
            , mediaId = Nothing
            , preload = P.Auto
            , title = Nothing
            , tracks = []
            }
        , TestExtra.testCodec "works with non-null fields"
            PI.decoder
            PI.encoder
            """ {
                "description": "a",
                "file": "b",
                "image": "c",
                "mediaId": "d",
                "preload": "auto",
                "title": "e",
                "tracks": []
            } """
            { description = Just "a"
            , file = "b"
            , image = Just "c"
            , mediaId = Just "d"
            , preload = P.Auto
            , title = Just "e"
            , tracks = []
            }
        ]


fuzzer : Fuzz.Fuzzer PI.PlaylistItem
fuzzer =
    Fuzz.map7 PI.PlaylistItem
        (Fuzz.maybe Fuzz.string)
        Fuzz.string
        (Fuzz.maybe Fuzz.string)
        (Fuzz.maybe Fuzz.string)
        P.fuzzer
        (Fuzz.maybe Fuzz.string)
        (Fuzz.list T.fuzzer)
