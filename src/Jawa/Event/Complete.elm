module Jawa.Event.Complete exposing (Complete, decoder, encode, tag)

{-|

@docs Complete, decoder, encode, tag

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#oncomplete>
-}
type alias Complete =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Complete
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : Complete -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []


{-| The tag that describes this type.
-}
tag : String
tag =
    "complete"
