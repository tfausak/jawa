module Jawa.Viewable exposing (Viewable(..), decoder, encode)

{-|

@docs Viewable, decoder, encode

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/viewability-events-1#onviewable>
-}
type Viewable
    = Hidden
    | Visible


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Viewable
decoder =
    Json.Decode.int
        |> Json.Decode.andThen (fromInt >> Json.Decode.Extra.fromResult)


fromInt : Int -> Result String Viewable
fromInt int =
    case int of
        0 ->
            Ok Hidden

        1 ->
            Ok Visible

        _ ->
            Err <| "unknown Viewable: " ++ String.fromInt int


{-| A JSON encoder.
-}
encode : Viewable -> Json.Encode.Value
encode =
    toInt >> Json.Encode.int


toInt : Viewable -> Int
toInt x =
    case x of
        Hidden ->
            0

        Visible ->
            1
