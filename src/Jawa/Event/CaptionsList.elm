module Jawa.Event.CaptionsList exposing (CaptionsList, decoder, encode, tag)

{-|

@docs CaptionsList, decoder, encode, tag

-}

import Jawa.CaptionTrack
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/captions-events#oncaptionslist>
-}
type alias CaptionsList =
    { track : Int
    , tracks : List Jawa.CaptionTrack.CaptionTrack
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder CaptionsList
decoder =
    Json.Decode.map2 CaptionsList
        (Json.Decode.field "track" Json.Decode.int)
        (Json.Decode.field "tracks" (Json.Decode.list Jawa.CaptionTrack.decoder))


{-| A JSON encoder.
-}
encode : CaptionsList -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "track", Json.Encode.int x.track )
        , ( "tracks", Json.Encode.list Jawa.CaptionTrack.encode x.tracks )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "captionsList"
