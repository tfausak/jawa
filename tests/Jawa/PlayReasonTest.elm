module Jawa.PlayReasonTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Extra.Test
import Jawa.PlayReason
import Test


test : Test.Test
test =
    Test.describe "Jawa.PlayReason"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.PlayReason.decoder Jawa.PlayReason.encode fuzzer
        , Jawa.Extra.Test.testCodec "works with autostart"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encode
            "\"autostart\""
            Jawa.PlayReason.Autostart
        , Jawa.Extra.Test.testCodec "works with external"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encode
            "\"external\""
            Jawa.PlayReason.External
        , Jawa.Extra.Test.testCodec "works with interaction"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encode
            "\"interaction\""
            Jawa.PlayReason.Interaction
        , Jawa.Extra.Test.testCodec "works with playlist"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encode
            "\"playlist\""
            Jawa.PlayReason.Playlist
        , Jawa.Extra.Test.testCodec "works with related-auto"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encode
            "\"related-auto\""
            Jawa.PlayReason.RelatedAuto
        , Jawa.Extra.Test.testCodec "works with related-interaction"
            Jawa.PlayReason.decoder
            Jawa.PlayReason.encode
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
