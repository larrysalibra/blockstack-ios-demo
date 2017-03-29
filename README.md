# blockstack-ios-demo

## Overview

This app demostrates that:

1. We can run an http server on iOS.
2. The http server can be accessed by a webview in the current app.
3. The http server can be accessed by other apps for a period of time when this app is in the background.


## Running

1. Clone this repo
2. Open `Blockstack.xcworkspace` in Xcode
3. Connect your iOS device
4. Click the run button


The app will:

1. Start a webserver on localhost (IPv4 only) port 8080.
2. Open a SFSafariWebView that loads http://localhost:8080
3. Serve a web page http://localhost:8080 that:
4. increments a counter on the server side each time it loads, and
5. displays information about the background state of the application.

You can also try starting the app, switching to Safari (or Chrome!) and loading http://localhost:8080.


