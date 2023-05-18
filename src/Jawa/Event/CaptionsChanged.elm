module Jawa.Event.CaptionsChanged exposing (CaptionsChanged, decoder, encode)

{-|

@docs CaptionsChanged, decoder, encode

-}

import Jawa.CaptionTrack
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/captions-events#oncaptionschanged>
-}
type alias CaptionsChanged =
    { track : Int
    , tracks : List Jawa.CaptionTrack.CaptionTrack
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder CaptionsChanged
decoder =
    Json.Decode.map2 CaptionsChanged
        (Json.Decode.field "track" Json.Decode.int)
        (Json.Decode.field "tracks" (Json.Decode.list Jawa.CaptionTrack.decoder))


{-| A JSON encoder.
-}
encode : CaptionsChanged -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "track", Json.Encode.int x.track )
        , ( "tracks", Json.Encode.list Jawa.CaptionTrack.encode x.tracks )
        ]
