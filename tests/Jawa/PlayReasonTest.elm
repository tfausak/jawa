module Jawa.PlayReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.PlayReason as PlR
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" PlR.decoder PlR.encoder fuzzer
        , TestExtra.testCodec "works with autostart"
            PlR.decoder
            PlR.encoder
            "\"autostart\""
            PlR.Autostart
        , TestExtra.testCodec "works with external"
            PlR.decoder
            PlR.encoder
            "\"external\""
            PlR.External
        , TestExtra.testCodec "works with interaction"
            PlR.decoder
            PlR.encoder
            "\"interaction\""
            PlR.Interaction
        , TestExtra.testCodec "works with playlist"
            PlR.decoder
            PlR.encoder
            "\"playlist\""
            PlR.Playlist
        , TestExtra.testCodec "works with related-auto"
            PlR.decoder
            PlR.encoder
            "\"related-auto\""
            PlR.RelatedAuto
        , TestExtra.testCodec "works with related-interaction"
            PlR.decoder
            PlR.encoder
            "\"related-interaction\""
            PlR.RelatedInteraction
        ]


fuzzer : Fuzz.Fuzzer PlR.PlayReason
fuzzer =
    Fuzz.oneOfValues
        [ PlR.Autostart
        , PlR.External
        , PlR.Interaction
        , PlR.Playlist
        , PlR.RelatedAuto
        , PlR.RelatedInteraction
        ]
