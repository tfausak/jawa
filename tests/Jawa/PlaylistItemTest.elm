module Jawa.PlaylistItemTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.PlaylistItem as PI
import Jawa.Preload as P
import Jawa.PreloadTest as P
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.PlaylistItem"
        [ TestExtra.fuzzCodec "round trips" PI.decoder PI.encoder fuzzer
        , TestExtra.testCodec "works"
            PI.decoder
            PI.encoder
            """ {
                "preload": "auto"
            } """
            { preload = P.Auto
            }
        ]


fuzzer : Fuzz.Fuzzer PI.PlaylistItem
fuzzer =
    Fuzz.map PI.PlaylistItem
        P.fuzzer
