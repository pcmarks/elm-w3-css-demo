port module W3CSS exposing (..)

{- This module is a translation, into Elm, of the html and javascript of the
   W3.CSS Material Design demo [here](https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_examples_material)

   It shows the use of Elm ports and onCLick behavior via HTML element class
   manipulation.
-}

import Html exposing (Html, a, br, div, footer, h1, h2, h3, header, hr, i, img, li, nav, p, span, text, ul)
import Html.Attributes exposing (alt, class, href, id, src, style, target, title)
import Html.Events exposing (onClick)


{- The Model contains two strings whose values correspond to the
   current values of the HTML display attribute of the mySidebar and
   myOverlay divisions. They can assume the values: "inline", "block" or "none"

   The two "scrolling" strings will have different Html class values
   depending on the direction of page scrolling.
-}


type alias Model =
    { mySidebar : String
    , myOverlay : String
    , myTopScrolling : String
    , myIntroScrolling : String
    , accordion : String
    , demoClass : String
    }


initialModel : Model
initialModel =
    { mySidebar = "inline"
    , myOverlay = "inline"
    , myTopScrolling = ""
    , myIntroScrolling = ""
    , accordion = ""
    , demoClass = "w3-hide"
    }


view : Model -> Html Msg
view model =
    div []
        [ nav
            [ class "w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card-2"
            , id "mySidebar"
            , style [ ( "z-index", "3" ), ( "width", "250px" ), ( "display", model.mySidebar ) ]
            ]
            [ a [ class "w3-bar-item w3-button w3-button-bottom w3-large", href "#" ]
                [ img
                    [ src "https://www.w3schools.com/images/w3schools.png"
                    , style [ ( "width", "80%" ) ]
                    ]
                    []
                ]
            , a
                [ class "w3-bar-item w3-button w3-hide-large w3-large"
                , onClick Close
                ]
                [ text "Close "
                , i [ class "fa fa-remove" ]
                    []
                ]
            , a
                [ class "w3-bar-item w3-button w3-teal"
                , href "#"
                ]
                [ text "Home" ]
            , a
                [ class "w3-bar-item w3-button"
                , href "#"
                ]
                [ text "Link 1" ]
            , a
                [ class "w3-bar-item w3-button"
                , href "#"
                ]
                [ text "Link 2" ]
            , a
                [ class "w3-bar-item w3-button"
                , href "#"
                ]
                [ text "Link 3" ]
            , a
                [ class "w3-bar-item w3-button"
                , href "#"
                ]
                [ text "Link 4" ]
            , a
                [ class "w3-bar-item w3-button"
                , href "#"
                ]
                [ text "Link 5" ]
            , div []
                [ a
                    [ class ("w3-bar-item w3-button " ++ model.accordion)
                    , onClick Accordion
                    ]
                    [ text "Dropdown "
                    , i [ class "fa fa-caret-down" ]
                        []
                    ]
                , div [ id "demo", class model.demoClass ]
                    [ a [ class "w3-bar-item w3-button", href "#" ]
                        [ text "Link" ]
                    , a [ class "w3-bar-item w3-button", href "#" ]
                        [ text "Link" ]
                    , a [ class "w3-bar-item w3-button", href "#" ]
                        [ text "Link" ]
                    ]
                ]
            ]
        , div
            [ class "w3-overlay w3-hide-large w3-animate-opacity"
            , id "myOverlay"
            , style [ ( "cursor ", "pointer" ), ( "display", model.myOverlay ) ]
            , onClick Close
            ]
            []
        , div [ class "w3-main", style [ ( "margin-left", "250px" ) ] ]
            [ div [ id "myTop", class ("w3-container w3-top w3-theme w3-large " ++ model.myTopScrolling) ]
                [ p []
                    [ i
                        [ class "fa fa-bars w3-button w3-teal w3-hide-large w3-xlarge"
                        , onClick Open
                        ]
                        []
                    , span
                        [ class ("w3-hide " ++ model.myIntroScrolling)
                        , id "myIntro"
                        ]
                        [ text "W3.CSS Introduction" ]
                    ]
                ]
            , header
                [ class "w3-container w3-theme"
                , style [ ( "padding", "64px 32px" ) ]
                ]
                [ h1 [ class "w3-xxxlarge" ]
                    [ text "W3.CSS" ]
                ]
            , div [ class "w3-container", style [ ( "padding", "32px" ) ] ]
                [ h2 []
                    [ text "What is W3.CSS? " ]
                , p []
                    [ text "W3.CSS is a modern CSS framework with built-in responsiveness:" ]
                , ul
                    [ class "w3-leftbar w3-theme-border"
                    , style [ ( "list-style", "none" ) ]
                    ]
                    [ li [] [ text "Smaller and faster than other CSS frameworks." ]
                    , li [] [ text "Easier to learn, and easier to use than other CSS frameworks." ]
                    , li [] [ text "Uses standard CSS only (No jQuery or JavaScript library)." ]
                    , li [] [ text "Speeds up mobile HTML apps." ]
                    , li [] [ text "Provides CSS equality for all devices. PC, laptop, tablet, and mobile:" ]
                    ]
                , br [] []
                , img
                    [ src "https://www.w3schools.com/w3css/img_responsive.png"
                    , style [ ( "width", "100%" ) ]
                    , alt "Responsive"
                    ]
                    []
                , hr [] []
                , h2 [] [ text "W3.CSS is Free" ]
                , p [] [ text "W3.CSS is free to use. No license is necessary." ]
                , hr [] []
                , h2 [] [ text "Easy to Use" ]
                , div [ class "w3-container w3-sand w3-leftbar" ]
                    [ p []
                        [ i []
                            [ text "Make it as simple as possible, but not simpler."
                            , br [] []
                            , text "Albert Einstein"
                            ]
                        ]
                    ]
                , hr [] []
                , h2 [] [ text "W3.CSS Web Site Templates" ]
                , p [] [ text "We have created some responsive W3CSS templates for you to use." ]
                , p [] [ text "You are free to modify, save, share, use or do whatever you want with them:" ]
                , div [ class "w3-panel w3-light-grey w3-padding-16 w3-card-2" ]
                    [ h3 [ class "w3-center" ]
                        [ text "Band Template" ]
                    , div [ class "w3-content", style [ ( "max-width", "800px" ) ] ]
                        [ a
                            [ href "https://www.w3schools.com/w3css/tryw3css_templates_band.htm"
                            , target "_blank"
                            , title "Band Demo"
                            ]
                            [ img
                                [ src "https://www.w3schools.com/w3css/img_temp_band.jpg"
                                , style [ ( "width", "98%" ), ( "margin", "20px 0" ) ]
                                , alt "Band Template"
                                ]
                                []
                            ]
                        , br [] []
                        ]
                    , div [ class "w3-row" ]
                        [ div [ class "w3-col m6" ]
                            [ a
                                [ href "https://www.w3schools.com/w3css/tryw3css_templates_band.htm"
                                , class "w3-button w3-padding-large w3-dark-grey"
                                , style [ ( "width", "98.5%" ) ]
                                ]
                                [ text "Demo" ]
                            ]
                        , div [ class "w3-col m6" ]
                            [ a
                                [ href "https://www.w3schools.com/w3css/w3css_templates.asp"
                                , class "w3-button w3-padding-large w3-dark-grey"
                                , style [ ( "width", "98.5%" ) ]
                                ]
                                [ text "More Templates" ]
                            ]
                        ]
                    ]
                , div [ class "w3-panel w3-light-grey w3-padding-16 w3-card-2" ]
                    [ h3 [ class "w3-center" ]
                        [ text "Blog Template" ]
                    , div [ class "w3-content", style [ ( "max-width", "800px" ) ] ]
                        [ img
                            [ src "https://www.w3schools.com/w3css/img_temp_blog.jpg"
                            , style [ ( "width", "98%" ), ( "margin", "20px 0" ) ]
                            , alt "Blog Template"
                            ]
                            []
                        ]
                    , br [] []
                    ]
                , div [ class "w3-row" ]
                    [ div [ class "w3-col m6" ]
                        [ a
                            [ href "https://www.w3schools.com/w3css/tryw3css_templates_blog.htm"
                            , class "w3-button w3-padding-large w3-dark-grey"
                            , style [ ( "width", "98.5%" ) ]
                            ]
                            [ text "Demo" ]
                        ]
                    , div [ class "w3-col m6" ]
                        [ a
                            [ href "https://www.w3schools.com/w3css/w3css_templates.asp"
                            , class "w3-button w3-padding-large w3-dark-grey"
                            , style [ ( "width", "98.5%" ) ]
                            ]
                            [ text "More Templates" ]
                        ]
                    ]
                ]
            , footer
                [ class "w3-container w3-theme"
                , style [ ( "padding", "32px" ) ]
                ]
                [ p []
                    [ text "Footer information goes here" ]
                ]
            ]
        ]


initialCmd : Cmd msg
initialCmd =
    Cmd.none



{- The messages that update understands are:
   Open - display the sidebar and overlay divisions
   Close - close the sidebar and overlay divisions
   OnScroll "scrollUp", onScroll "scrollDown" - when the user scrolls, alter the
           display of the myTop and myIntro divisions
-}


type Msg
    = Open
    | Close
    | OnScroll String
    | Accordion



{- when a accordion line is clicked we want to alternately show and hide
   its contents
-}


toggleAccordion : Model -> Model
toggleAccordion model =
    if String.contains "w3-show" model.demoClass then
        { model | accordion = "", demoClass = "w3-hide" }
    else
        { model | accordion = "w3-theme", demoClass = "w3-show" }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Open ->
            ( { model | mySidebar = "block", myOverlay = "block" }, Cmd.none )

        Close ->
            ( { model | mySidebar = "none", myOverlay = "none" }, Cmd.none )

        OnScroll "scrollUp" ->
            ( { model
                | myTopScrolling = "w3-card-4 w3-animate-opacity"
                , myIntroScrolling = "w3-show-inline-block"
              }
            , Cmd.none
            )

        OnScroll "scrollDown" ->
            ( { model
                | myTopScrolling = ""
                , myIntroScrolling = ""
              }
            , Cmd.none
            )

        OnScroll _ ->
            ( model, Cmd.none )

        Accordion ->
            ( toggleAccordion model, Cmd.none )



{- These are messages that get sent to us from the page when scrolling occurs. -}


port onScroll : (String -> msg) -> Sub msg


main : Program Never Model Msg
main =
    Html.program
        { init = ( initialModel, initialCmd )
        , view = view
        , update = update
        , subscriptions = \_ -> onScroll OnScroll
        }
