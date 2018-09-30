-- type User
--   = Regular String
--   | Visitor String
-- toName : User -> String
-- toName user =
--   case user of
--     Regular name ->
--       name
--     Visitor name ->
--       name


type User
    = Regular String Int
    | Visitor String
    | Anonymous


toName : User -> String
toName user =
    case user of
        Regular name age ->
            name ++ " (" ++ String.fromInt age ++ ")"

        Visitor name ->
            name

