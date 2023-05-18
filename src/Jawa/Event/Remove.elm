module Jawa.Event.Remove exposing (Remove, decoder, encode)

{-|

@docs Remove, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/events-1#onremove>
-}
type alias Remove =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Remove
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : Remove -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []
