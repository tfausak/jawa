module Jawa.Event.SubtitlesTracks exposing (SubtitlesTracks, decoder, encode, tag)

{-|

@docs SubtitlesTracks, decoder, encode, tag

-}

import Jawa.SubtitleTrack
import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias SubtitlesTracks =
    { tracks : List Jawa.SubtitleTrack.SubtitleTrack
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder SubtitlesTracks
decoder =
    Json.Decode.map SubtitlesTracks
        (Json.Decode.field "tracks" (Json.Decode.list Jawa.SubtitleTrack.decoder))


{-| A JSON encoder.
-}
encode : SubtitlesTracks -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "tracks", Json.Encode.list Jawa.SubtitleTrack.encode x.tracks )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "subtitlesTracks"
