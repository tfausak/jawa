module Jawa.EventTest exposing (test)

import Fuzz
import Jawa.Event as Event
import Jawa.Event.BreakpointTest as Breakpoint
import Jawa.Event.BufferFull as BufferFull
import Jawa.Event.BufferFullTest as BufferFull
import Jawa.Event.ClickTest as Click
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.Event.DisplayClickTest as DisplayClick
import Jawa.Event.FirstFrameTest as FirstFrame
import Jawa.Event.FullscreenTest as Fullscreen
import Jawa.Event.MediaTypeTest as MediaType
import Jawa.Event.ProviderFirstFrame as ProviderFirstFrame
import Jawa.Event.ProviderFirstFrameTest as ProviderFirstFrame
import Jawa.Event.ReadyTest as Ready
import Jawa.Event.Remove as Remove
import Jawa.Event.RemoveTest as Remove
import Jawa.Event.Seeked as Seeked
import Jawa.Event.SeekedTest as Seeked
import Jawa.Event.SetupErrorTest as SetupError
import Jawa.Event.UserActive as UserActive
import Jawa.Event.UserActiveTest as UserActive
import Jawa.Event.UserInactive as UserInactive
import Jawa.Event.UserInactiveTest as UserInactive
import Jawa.Event.ViewableTest as Viewable
import Jawa.MediaType as MT
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as V
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
                "mediaType": "audio",
                "type": "mediaType"
            } """
            (Event.MediaType
                { mediaType = MT.Audio
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
                , viewable = V.Hidden
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
        , TestExtra.testCodec "works with viewable"
            Event.decoder
            Event.encoder
            """ {
                "viewable": 0,
                "type": "viewable"
            } """
            (Event.Viewable
                { viewable = V.Hidden }
            )
        ]


fuzzer : Fuzz.Fuzzer Event.Event
fuzzer =
    Fuzz.oneOf
        [ Fuzz.map Event.Breakpoint Breakpoint.fuzzer
        , Fuzz.map Event.BufferFull BufferFull.fuzzer
        , Fuzz.map Event.Click Click.fuzzer
        , Fuzz.map Event.DisplayClick DisplayClick.fuzzer
        , Fuzz.map Event.FirstFrame FirstFrame.fuzzer
        , Fuzz.map Event.Fullscreen Fullscreen.fuzzer
        , Fuzz.map Event.MediaType MediaType.fuzzer
        , Fuzz.map Event.ProviderFirstFrame ProviderFirstFrame.fuzzer
        , Fuzz.map Event.Ready Ready.fuzzer
        , Fuzz.map Event.Remove Remove.fuzzer
        , Fuzz.map Event.Seeked Seeked.fuzzer
        , Fuzz.map Event.SetupError SetupError.fuzzer
        , Fuzz.map Event.UserActive UserActive.fuzzer
        , Fuzz.map Event.UserInactive UserInactive.fuzzer
        , Fuzz.map Event.Viewable Viewable.fuzzer
        ]
