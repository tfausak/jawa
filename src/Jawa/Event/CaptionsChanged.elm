module Jawa.Event.CaptionsChanged exposing (CaptionsChanged, decoder, encoder)

{-|

@docs CaptionsChanged, decoder, encoder

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
encoder : CaptionsChanged -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "track", Json.Encode.int x.track )
        , ( "tracks", Json.Encode.list Jawa.CaptionTrack.encoder x.tracks )
        ]
