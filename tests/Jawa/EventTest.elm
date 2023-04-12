module Jawa.EventTest exposing (test)

import Fuzz
import Jawa.Event as Event
import Jawa.Event.BreakpointTest as BreakpointTest
import Jawa.Event.BufferFull as BufferFull
import Jawa.Event.BufferFullTest as BufferFullTest
import Jawa.Event.ClickTest as ClickTest
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.Event.DisplayClickTest as DisplayClickTest
import Jawa.Event.FirstFrameTest as FirstFrameTest
import Jawa.Event.FullscreenTest as FullscreenTest
import Jawa.Event.MediaTypeTest as MediaTypeTest
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
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as Viewable
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Event.decoder Event.encoder fuzzer
        , TestExtra.testCodec "works with breakpoint"
            Event.decoder
            Event.encoder
            """ {
                "breakpoint": 0,
                "type": "breakpoint"
            } """
            (Event.Breakpoint
                { breakpoint = 0
                }
            )
        , TestExtra.testCodec "works with bufferFull"
            Event.decoder
            Event.encoder
            """ {
                "type": "bufferFull"
            } """
            (Event.BufferFull BufferFull.BufferFull)
        , TestExtra.testCodec "works with click"
            Event.decoder
            Event.encoder
            """ {
                "isTrusted": false,
                "type": "click"
            } """
            (Event.Click
                { isTrusted = False
                }
            )
        , TestExtra.testCodec "works with displayClick"
            Event.decoder
            Event.encoder
            """ {
                "type": "displayClick"
            } """
            (Event.DisplayClick DisplayClick.DisplayClick)
        , TestExtra.testCodec "works with firstFrame"
            Event.decoder
            Event.encoder
            """ {
                "loadTime": 0.1,
                "type": "firstFrame"
            } """
            (Event.FirstFrame
                { loadTime = 0.1
                }
            )
        , TestExtra.testCodec "works with fullscreen"
            Event.decoder
            Event.encoder
            """ {
                "fullscreen": false,
                "type": "fullscreen"
            } """
            (Event.Fullscreen
                { fullscreen = False
                }
            )
        , TestExtra.testCodec "works with mediaType"
            Event.decoder
            Event.encoder
            """ {
                "mediaType": "",
                "type": "mediaType"
            } """
            (Event.MediaType
                { mediaType = ""
                }
            )
        , TestExtra.testCodec "works with providerFirstFrame"
            Event.decoder
            Event.encoder
            """ {
                "type": "providerFirstFrame"
            } """
            (Event.ProviderFirstFrame ProviderFirstFrame.ProviderFirstFrame)
        , TestExtra.testCodec "works with ready"
            Event.decoder
            Event.encoder
            """ {
                "setupTime": 0.1,
                "viewable": 0,
                "type": "ready"
            } """
            (Event.Ready
                { setupTime = 0.1
                , viewable = Viewable.Hidden
                }
            )
        , TestExtra.testCodec "works with remove"
            Event.decoder
            Event.encoder
            """ {
                "type": "remove"
            } """
            (Event.Remove Remove.Remove)
        , TestExtra.testCodec "works with seeked"
            Event.decoder
            Event.encoder
            """ {
                "type": "seeked"
            } """
            (Event.Seeked Seeked.Seeked)
        , TestExtra.testCodec "works with setupError"
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
        , TestExtra.testCodec "works with userActive"
            Event.decoder
            Event.encoder
            """ {
                "type": "userActive"
            } """
            (Event.UserActive UserActive.UserActive)
        , TestExtra.testCodec "works with userInactive"
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
        [ Fuzz.map Event.Breakpoint BreakpointTest.fuzzer
        , Fuzz.map Event.BufferFull BufferFullTest.fuzzer
        , Fuzz.map Event.Click ClickTest.fuzzer
        , Fuzz.map Event.DisplayClick DisplayClickTest.fuzzer
        , Fuzz.map Event.FirstFrame FirstFrameTest.fuzzer
        , Fuzz.map Event.Fullscreen FullscreenTest.fuzzer
        , Fuzz.map Event.MediaType MediaTypeTest.fuzzer
        , Fuzz.map Event.ProviderFirstFrame ProviderFirstFrameTest.fuzzer
        , Fuzz.map Event.Ready ReadyTest.fuzzer
        , Fuzz.map Event.Remove RemoveTest.fuzzer
        , Fuzz.map Event.Seeked SeekedTest.fuzzer
        , Fuzz.map Event.SetupError SetupErrorTest.fuzzer
        , Fuzz.map Event.UserActive UserActiveTest.fuzzer
        , Fuzz.map Event.UserInactive UserInactiveTest.fuzzer
        ]
