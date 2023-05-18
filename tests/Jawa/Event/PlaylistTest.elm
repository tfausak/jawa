module Jawa.Event.PlaylistTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Playlist
import Jawa.Extra.Test
import Jawa.PlaylistItemTest
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Playlist"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.Playlist.decoder Jawa.Event.Playlist.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.Playlist.decoder
            Jawa.Event.Playlist.encode
            """ {
                "playlist": []
            } """
            { playlist = []
            }
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Playlist.Playlist
fuzzer =
    Fuzz.map Jawa.Event.Playlist.Playlist
        (Fuzz.listOfLengthBetween 0 2 Jawa.PlaylistItemTest.fuzzer)
