module Jawa.CaptionTrack exposing (CaptionTrack, decoder, encoder)

{-|

@docs CaptionTrack, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/getcaptionslist>
-}
type alias CaptionTrack =
    { id : String
    , label : String
    , language : String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder CaptionTrack
decoder =
    Json.Decode.map3 CaptionTrack
        (Json.Decode.field "id" Json.Decode.string)
        (Json.Decode.field "label" Json.Decode.string)
        (Json.Decode.field "language" Json.Decode.string)


{-| A JSON encoder.
-}
encoder : CaptionTrack -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "id", Json.Encode.string x.id )
        , ( "label", Json.Encode.string x.label )
        , ( "language", Json.Encode.string x.language )
        ]
