this is an example of two problems that I had.

1. feature request.
   The application has authentication by code and deep link.
   I open the application using the link and I need to get to it after I enter the authentication code.
   To do this, I need to remember the link before authentication. It would be convenient if I received not only a string, but also the name of this link, so it would be easier to check it.
   You can see an example in the router_redirect file.
   
   test deeplink on android `adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d 'app://test.dev/main/child/'`

2. strange behavior.
   The page is recreated every time you return to it or use hot restart.
   But the strangest thing is that all final fields are created anew, and the build method is not called and the old fields remain there.
   You can see an example in the main_page file.