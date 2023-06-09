module Jawa.Event.Seek exposing (Seek, decoder, encode, tag)

{-|

@docs Seek, decoder, encode, tag

-}

import Jawa.Metadata
import Jawa.SeekRange
import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Maybe.Extra


{-| <https://docs.jwplayer.com/players/reference/seek-events-1#onseek>
-}
type alias Seek =
    { currentTime : Maybe Float
    , duration : Float
    , metadata : Jawa.Metadata.Metadata
    , offset : Float
    , position : Maybe Float
    , seekRange : Jawa.SeekRange.SeekRange
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Seek
decoder =
    Json.Decode.map6 Seek
        (Json.Decode.Extra.optionalNullableField "currentTime" Json.Decode.float)
        (Json.Decode.field "duration" Json.Decode.float)
        (Json.Decode.field "metadata" Jawa.Metadata.decoder)
        (Json.Decode.field "offset" Json.Decode.float)
        (Json.Decode.Extra.optionalNullableField "position" Json.Decode.float)
        (Json.Decode.field "seekRange" Jawa.SeekRange.decoder)


{-| A JSON encoder.
-}
encode : Seek -> Json.Encode.Value
encode x =
    [ Maybe.map (Json.Encode.float >> Tuple.pair "currentTime") x.currentTime
    , Just ( "duration", Json.Encode.float x.duration )
    , Just ( "metadata", Jawa.Metadata.encode x.metadata )
    , Just ( "offset", Json.Encode.float x.offset )
    , Maybe.map (Json.Encode.float >> Tuple.pair "position") x.position
    , Just ( "seekRange", Jawa.SeekRange.encode x.seekRange )
    ]
        |> Maybe.Extra.values
        |> Json.Encode.object


{-| The tag that describes this type.
-}
tag : String
tag =
    "seek"
