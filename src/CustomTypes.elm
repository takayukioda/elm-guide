-- type UserStatus
--   = Regular
--   | Visitor
-- type alias User =
--   { status : UserStatus
--   , name : String
--   }
-- thomas = { status = Regular, name = "Thomas" }
-- kate95 = { status = Visitor, name = "kate95" }



type User
    = Regular String
    | Visitor String


thomas = { status = Regular, name = "Thomas" }
kate95 = { status = Visitor, name = "kate95" }


thom = Regular "Thomas"
kate = Visitor "kate95"
