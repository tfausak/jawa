module Jawa.Event.Pause exposing (Pause, decoder, encode, tag)

{-|

@docs Pause, decoder, encode, tag

-}

import Jawa.PauseReason
import Jawa.State
import Jawa.Viewable
import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Maybe.Extra


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onpause>
-}
type alias Pause =
    { newstate : Jawa.State.State
    , oldstate : Jawa.State.State
    , pauseReason : Maybe Jawa.PauseReason.PauseReason
    , reason : Jawa.State.State
    , viewable : Jawa.Viewable.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Pause
decoder =
    Json.Decode.map5 Pause
        (Json.Decode.field "newstate" Jawa.State.decoder)
        (Json.Decode.field "oldstate" Jawa.State.decoder)
        (Json.Decode.Extra.optionalNullableField "pauseReason" Jawa.PauseReason.decoder)
        (Json.Decode.field "reason" Jawa.State.decoder)
        (Json.Decode.field "viewable" Jawa.Viewable.decoder)


{-| A JSON encoder.
-}
encode : Pause -> Json.Encode.Value
encode x =
    [ Just ( "newstate", Jawa.State.encode x.newstate )
    , Just ( "oldstate", Jawa.State.encode x.oldstate )
    , Maybe.map (Jawa.PauseReason.encode >> Tuple.pair "pauseReason") x.pauseReason
    , Just ( "reason", Jawa.State.encode x.reason )
    , Just ( "viewable", Jawa.Viewable.encode x.viewable )
    ]
        |> Maybe.Extra.values
        |> Json.Encode.object


{-| The tag that describes this type.
-}
tag : String
tag =
    "pause"
