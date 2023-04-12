module Jawa.Event.Remove exposing (Remove(..), decoder, encoder)

{-|

@docs Remove, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/events-1#onremove>
-}
type Remove
    = Remove


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Remove
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always Remove)


{-| A JSON encoder.
-}
encoder : Remove -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
