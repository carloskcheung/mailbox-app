# Mail Box Application

MailBox App using Swift

<img src="" />


Spent about ~X hours working on this! 

---

# Requirements

## Static photo tiles on the initial screen
Completed: Photo tiles move with scrolling

## Sign In
1. Completed: Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
2. Competed: User sees an error alert when no email is present or no password is present.
3. Completed: User sees a loading screen upon tapping the Sign In button.
4. Unknown: alertView.dismissWithClickedButtonIndex(0, animated: true) dismisses the loading screen with no buttons.
5. Completed: User sees an error alert when entering the wrong email/password combination.
6. Completed: User is taken to the tutorial screens upon entering the correct email/password combination.
* in-complete (Optional): When the keyboard is visible, if the user pulls down on the scrollview, it will dismiss the keyboard. 
* in-complete (Optional): On appear, scale the form up and fade it in.

## Optional: Sign Up
1. Complete: Tapping in the form reveals the keyboard and shifts the scrollview and "Create a Dropbox" button up.
2. Complete: Tapping the Agree to Terms checkbox selects the checkbox.
3. Complete: Tapping on Terms shows a webview with the terms.
4. Complete: User is taken to the tutorial screens upon tapping the "Create a Dropbox" button.

## Tutorial Screens
1. Complete: User can page between the screens
2. Complete: User can page between the screens with updated dots
* in-complete (Optional): Upon reaching the 4th page, hide the dots and show the "Take Carousel for a Spin" button -- Had some small issues with hiding the page-control on the 4th page.

## Image Timeline
1. Complete: Display a scrollable view of images.
2. Complete: User can tap on the conversations button to see the conversations screen (push).
3. Complete: User can tap on the profile image to see the settings view (modal from below).

## Settings
1. Complete: User can dismiss the settings screen.
2. Complete: User can log out

## Learn more about Carousel
1. Complete: Show the "Learn more about Carousel" button in the photo timeline.
2. Complete: Tap the X to dismiss the banner
* in-complete (Optional): Track the 3 events: View a photo full screen, Swipe left and right, & Share a photo 
* in-complete (Optional): Upon completion of the events, mark them green. 
* in-complete (Optional): When all events are completed, dismiss the banner.
