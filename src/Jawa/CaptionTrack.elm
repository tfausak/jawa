module Jawa.CaptionTrack exposing (CaptionTrack, decoder, encode)

{-|

@docs CaptionTrack, decoder, encode

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Maybe.Extra


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
    [ Just ( "id", Json.Encode.string x.id )
    , Just ( "label", Json.Encode.string x.label )
    , Maybe.map (Json.Encode.string >> Tuple.pair "language") x.language
    ]
        |> Maybe.Extra.values
        |> Json.Encode.object
