module Jawa.Event.PlaylistTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.Playlist as Playlist
import Jawa.PlaylistItemTest as PI
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.Playlist"
        [ TestExtra.fuzzCodec "round trips" Playlist.decoder Playlist.encoder fuzzer
        , TestExtra.testCodec "works"
            Playlist.decoder
            Playlist.encoder
            """ {
                "playlist": []
            } """
            { playlist = []
            }
        ]


fuzzer : Fuzz.Fuzzer Playlist.Playlist
fuzzer =
    Fuzz.map Playlist.Playlist
        (Fuzz.list PI.fuzzer)
