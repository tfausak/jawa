module Jawa.Event.Viewable exposing (Viewable, decoder, encode)

{-|

@docs Viewable, decoder, encode

-}

import Jawa.Viewable
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/viewability-events-1#onviewable>
-}
type alias Viewable =
    { viewable : Jawa.Viewable.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Viewable
decoder =
    Json.Decode.map Viewable
        (Json.Decode.field "viewable" Jawa.Viewable.decoder)


{-| A JSON encoder.
-}
encode : Viewable -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "viewable", Jawa.Viewable.encode x.viewable )
        ]
