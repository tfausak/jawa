module Jawa.Event.ProviderFirstFrameTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.ProviderFirstFrame as ProviderFirstFrame
import Jawa.Test.Extra as TestExtra
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event.ProviderFirstFrame"
        [ TestExtra.fuzzCodec "round trips" ProviderFirstFrame.decoder ProviderFirstFrame.encoder fuzzer
        , TestExtra.testCodec "works"
            ProviderFirstFrame.decoder
            ProviderFirstFrame.encoder
            """ {
            } """
            ProviderFirstFrame.ProviderFirstFrame
        ]


fuzzer : Fuzz.Fuzzer ProviderFirstFrame.ProviderFirstFrame
fuzzer =
    Fuzz.constant ProviderFirstFrame.ProviderFirstFrame
