module Jawa.Event.PlaybackRateChanged exposing (PlaybackRateChanged, decoder, encoder)

{-|

@docs PlaybackRateChanged, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onplaybackratechanged>
-}
type alias PlaybackRateChanged =
    { playbackRate : Float
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlaybackRateChanged
decoder =
    Json.Decode.map PlaybackRateChanged
        (Json.Decode.field "playbackRate" Json.Decode.float)


{-| A JSON encoder.
-}
encoder : PlaybackRateChanged -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "playbackRate", Json.Encode.float x.playbackRate )
        ]
