module Jawa.Event.ProviderFirstFrameTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.ProviderFirstFrame
import Jawa.Extra.Test
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.ProviderFirstFrame"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.ProviderFirstFrame.decoder Jawa.Event.ProviderFirstFrame.encode fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Event.ProviderFirstFrame.decoder
            Jawa.Event.ProviderFirstFrame.encode
            """ {
            } """
            {}
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.ProviderFirstFrame.ProviderFirstFrame
fuzzer =
    Fuzz.constant {}
