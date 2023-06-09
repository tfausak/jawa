module Jawa.Event.PlaybackRateChanged exposing (PlaybackRateChanged, decoder, encode, tag)

{-|

@docs PlaybackRateChanged, decoder, encode, tag

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
encode : PlaybackRateChanged -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "playbackRate", Json.Encode.float x.playbackRate )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "playbackRateChanged"
