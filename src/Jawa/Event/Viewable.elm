module Jawa.Event.Viewable exposing (Viewable, decoder, encoder)

{-|

@docs Viewable, decoder, encoder

-}

import Jawa.Viewable as V
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/viewability-events-1#onviewable>
-}
type alias Viewable =
    { viewable : V.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Viewable
decoder =
    Json.Decode.map Viewable
        (Json.Decode.field "viewable" V.decoder)


{-| A JSON encoder.
-}
encoder : Viewable -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "viewable", V.encoder x.viewable )
        ]
