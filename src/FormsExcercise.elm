module Main exposing (Model, Msg(..), init, main, update, validate, validateAge, validateContains, validateLength, validatePassword, validatePasswordMatch, view, viewInput, viewSubmit, viewValidation)

import Browser
import Char
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Maybe
import String



-- Main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Model


type alias Model =
    { name : String
    , age : String
    , password : String
    , passwordAgain : String
    , isValid : Bool
    }


init : Model
init =
    Model "" "" "" "" False



-- Update


type Msg
    = Name String
    | Age String
    | Password String
    | PasswordAgain String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Age age ->
            { model | age = age }

        Password password ->
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }

        Submit ->
            { model | isValid = validate model }



-- View


view : Model -> Html Msg
view model =
    div []
        [ viewInput "text" "Name" model.name Name
        , viewInput "number" "Age" model.age Age
        , viewInput "password" "Password" model.password Password
        , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
        , viewSubmit "Submit" Submit
        , viewValidation model
        ]


viewInput : String -> String -> String -> (String -> Msg) -> Html Msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewSubmit : String -> Msg -> Html Msg
viewSubmit label msg =
    input [ type_ "submit", value "submit", onClick msg ] [ text label ]


viewValidation : Model -> Html Msg
viewValidation model =
    if model.isValid then
        div [ style "color" "green" ] [ text "OK" ]

    else
        div [ style "color" "red" ] [ text "Invalid!" ]


validate : Model -> Bool
validate model =
    if
        validatePassword model.password model.passwordAgain
            && validateAge model.age
    then
        True

    else
        False


validateLength : String -> Bool
validateLength p =
    if String.length p >= 8 then
        True

    else
        False


validatePasswordMatch : String -> String -> Bool
validatePasswordMatch p pa =
    if p == pa then
        True

    else
        False


validateContains : String -> Bool
validateContains p =
    if
        String.any Char.isDigit p
            && String.any Char.isUpper p
            && String.any Char.isLower p
    then
        True

    else
        False


validatePassword : String -> String -> Bool
validatePassword password passwordAgain =
    if
        validateLength password
            && validateContains password
            && validatePasswordMatch password passwordAgain
    then
        True

    else
        False


validateAge : String -> Bool
validateAge age =
    if String.toInt age == Nothing then
        False

    else
        True
