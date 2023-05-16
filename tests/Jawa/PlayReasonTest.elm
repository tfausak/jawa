module Jawa.PlayReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.PlayReason
import Jawa.Test.Extra
import Test


test : Test.Test
test =
    Test.describe "Jawa.PlayReason"
        [ Jawa.Test.Extra.fuzzCodec "round trips" Jawa.PlayReason.decoder Jawa.PlayReason.encoder fuzzer
        , Jawa.Test.Extra.testCodec "works with autostart"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encoder
            "\"autostart\""
            Jawa.PlayReason.Autostart
        , Jawa.Test.Extra.testCodec "works with external"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encoder
            "\"external\""
            Jawa.PlayReason.External
        , Jawa.Test.Extra.testCodec "works with interaction"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encoder
            "\"interaction\""
            Jawa.PlayReason.Interaction
        , Jawa.Test.Extra.testCodec "works with playlist"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encoder
            "\"playlist\""
            Jawa.PlayReason.Playlist
        , Jawa.Test.Extra.testCodec "works with related-auto"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encoder
            "\"related-auto\""
            Jawa.PlayReason.RelatedAuto
        , Jawa.Test.Extra.testCodec "works with related-interaction"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encoder
            "\"related-interaction\""
            Jawa.PlayReason.RelatedInteraction
        ]


fuzzer : Fuzz.Fuzzer Jawa.PlayReason.PlayReason
fuzzer =
    Fuzz.oneOfValues
        [ Jawa.PlayReason.Autostart
        , Jawa.PlayReason.External
        , Jawa.PlayReason.Interaction
        , Jawa.PlayReason.Playlist
        , Jawa.PlayReason.RelatedAuto
        , Jawa.PlayReason.RelatedInteraction
        ]
