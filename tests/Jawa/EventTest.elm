module Jawa.EventTest exposing (test)

import Fuzz
import Jawa.Event as Event
import Jawa.Event.BufferFull as BufferFull
import Jawa.Event.BufferFullTest as BufferFullTest
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.Event.DisplayClickTest as DisplayClickTest
import Jawa.Event.ProviderFirstFrame as ProviderFirstFrame
import Jawa.Event.ProviderFirstFrameTest as ProviderFirstFrameTest
import Jawa.Event.ReadyTest as ReadyTest
import Jawa.Event.Remove as Remove
import Jawa.Event.RemoveTest as RemoveTest
import Jawa.Event.Seeked as Seeked
import Jawa.Event.SeekedTest as SeekedTest
import Jawa.Event.SetupErrorTest as SetupErrorTest
import Jawa.Event.UserActive as UserActive
import Jawa.Event.UserActiveTest as UserActiveTest
import Jawa.Event.UserInactive as UserInactive
import Jawa.Event.UserInactiveTest as UserInactiveTest
import Jawa.TestHelper as TestHelper
import Jawa.Visibility as Visibility
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" Event.decoder Event.encoder fuzzer
        , TestHelper.testCodec "works with bufferFull"
            Event.decoder
            Event.encoder
            """ {
                "type": "bufferFull"
            } """
            (Event.BufferFull BufferFull.BufferFull)
        , TestHelper.testCodec "works with displayClick"
            Event.decoder
            Event.encoder
            """ {
                "type": "displayClick"
            } """
            (Event.DisplayClick DisplayClick.DisplayClick)
        , TestHelper.testCodec "works with providerFirstFrame"
            Event.decoder
            Event.encoder
            """ {
                "type": "providerFirstFrame"
            } """
            (Event.ProviderFirstFrame ProviderFirstFrame.ProviderFirstFrame)
        , TestHelper.testCodec "works with ready"
            Event.decoder
            Event.encoder
            """ {
                "setupTime": 0.1,
                "viewable": 0,
                "type": "ready"
            } """
            (Event.Ready
                { setupTime = 0.1
                , viewable = Visibility.Hidden
                }
            )
        , TestHelper.testCodec "works with remove"
            Event.decoder
            Event.encoder
            """ {
                "type": "remove"
            } """
            (Event.Remove Remove.Remove)
        , TestHelper.testCodec "works with seeked"
            Event.decoder
            Event.encoder
            """ {
                "type": "seeked"
            } """
            (Event.Seeked Seeked.Seeked)
        , TestHelper.testCodec "works with setupError"
            Event.decoder
            Event.encoder
            """ {
                "code": 0,
                "message": "",
                "type": "setupError"
            } """
            (Event.SetupError
                { code = 0
                , message = ""
                }
            )
        , TestHelper.testCodec "works with userActive"
            Event.decoder
            Event.encoder
            """ {
                "type": "userActive"
            } """
            (Event.UserActive UserActive.UserActive)
        , TestHelper.testCodec "works with userInactive"
            Event.decoder
            Event.encoder
            """ {
                "type": "userInactive"
            } """
            (Event.UserInactive UserInactive.UserInactive)
        ]


fuzzer : Fuzz.Fuzzer Event.Event
fuzzer =
    Fuzz.oneOf
        [ Fuzz.map Event.BufferFull BufferFullTest.fuzzer
        , Fuzz.map Event.DisplayClick DisplayClickTest.fuzzer
        , Fuzz.map Event.ProviderFirstFrame ProviderFirstFrameTest.fuzzer
        , Fuzz.map Event.Ready ReadyTest.fuzzer
        , Fuzz.map Event.Remove RemoveTest.fuzzer
        , Fuzz.map Event.Seeked SeekedTest.fuzzer
        , Fuzz.map Event.SetupError SetupErrorTest.fuzzer
        , Fuzz.map Event.UserActive UserActiveTest.fuzzer
        , Fuzz.map Event.UserInactive UserInactiveTest.fuzzer
        ]
