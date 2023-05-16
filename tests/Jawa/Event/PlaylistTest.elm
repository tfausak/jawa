module Jawa.Event.PlaylistTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Playlist
import Jawa.PlaylistItemTest
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Playlist"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.Event.Playlist.decoder Jawa.Event.Playlist.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works"
            Jawa.Event.Playlist.decoder
            Jawa.Event.Playlist.encoder
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
