module Jawa.Event.ProviderFirstFrameTest exposing
    ( fuzzer
    , test
    )

import Fuzz
import Jawa.Event.ProviderFirstFrame as ProviderFirstFrame
import Jawa.TestHelper as TestHelper
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" ProviderFirstFrame.decoder ProviderFirstFrame.encoder fuzzer
        , TestHelper.testCodec "works"
            ProviderFirstFrame.decoder
            ProviderFirstFrame.encoder
            """ {
            } """
            ProviderFirstFrame.ProviderFirstFrame
        ]


fuzzer : Fuzz.Fuzzer ProviderFirstFrame.ProviderFirstFrame
fuzzer =
    Fuzz.constant ProviderFirstFrame.ProviderFirstFrame
