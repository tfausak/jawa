module Jawa.CaptionTrack exposing (CaptionTrack, decoder, encode)

{-|

@docs CaptionTrack, decoder, encode

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Json.Encode.Extra


{-| <https://docs.jwplayer.com/players/reference/getcaptionslist>
-}
type alias CaptionTrack =
    { id : String
    , label : String
    , language : Maybe String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder CaptionTrack
decoder =
    Json.Decode.map3 CaptionTrack
        (Json.Decode.field "id" Json.Decode.string)
        (Json.Decode.field "label" Json.Decode.string)
        (Json.Decode.Extra.optionalNullableField "language" Json.Decode.string)


{-| A JSON encoder.
-}
encode : CaptionTrack -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "id", Json.Encode.string x.id )
        , ( "label", Json.Encode.string x.label )
        , ( "language", Json.Encode.Extra.maybe Json.Encode.string x.language )
        ]
