module Jawa.MediaType exposing (MediaType(..), decoder, encode)

{-|

@docs MediaType, decoder, encode

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode


{-| This type is not documented.
-}
type MediaType
    = Audio
    | Video


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder MediaType
decoder =
    Json.Decode.string
        |> Json.Decode.andThen (fromString >> Json.Decode.Extra.fromResult)


fromString : String -> Result String MediaType
fromString string =
    case string of
        "audio" ->
            Ok Audio

        "video" ->
            Ok Video

        _ ->
            Err <| "invalid MediaType: " ++ string


{-| A JSON encoder.
-}
encode : MediaType -> Json.Encode.Value
encode =
    toString >> Json.Encode.string


toString : MediaType -> String
toString x =
    case x of
        Audio ->
            "audio"

        Video ->
            "video"
