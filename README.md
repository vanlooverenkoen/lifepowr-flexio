# flexio_kvl

An application to see peak consumption in the MyFlexio App

## Assumptions (Chart is calculated that this is always the case)

- Data is always returned in 15 min intervals.
- Data is always returned in correct order.
- Data is always returned in the same timezone as the user.

## Running the application

You can just use flutter stable.
Normally I would be using fvm for better version management. But to keep it as simple as possible I did not use it

web demo: [https://vanlooverenkoen.be/flexio](https://vanlooverenkoen.be/flexio)

## Remarks:

- Current implementation was done for phone. No tablet or web support. (only small improvements on web)
- I did not use SVG's to keep it simple, but I would normally use SVG's for icons.
- The home page is recreated from the images in the playstore. The charts are just images. But I wanted to make it a more complete application.
- I would do a lot more testing. But I did not have time to do it, gave some examples on what is important to do. (golden tests, widget tests, integration tests)
- I would use GetX to do navigation. But to keep it simple I used simple navigators. To keep the viewmodels clean

## Questions:

### We use our own APIs to show data and show and change (iot device) settings in our Mobile App MyFlexiO. API changes are always additive, and additions shouldn’t lead to breaking any functionality in the Mobile app. How could you ensure in a Flutter app that additive changes to an API don’t cause errors?

Versioning of the API is the key. You can use a version number in the url or in the header. The app will only have actively used api calls in the webservice in the app.
But when an app update is released other users with other versions of the app can still use the app.
example:

- {baseUrl}/api/v1/history
- {baseUrl}/api/v2/history (Renamed 2 fields)

In this way the app that is still using v1 can still be used. And the new app can talk to the v2 with the correct new fields.
After a while you can remove the v1 api calls from the app. And the remote config should be updated to set the min app version to the one that is using v1.

### With certain Mobile app updates, we want to force the user to use the latest version. How
  would you tackle this?

In order to implement app updates you can do multiple things. I usually combine a remote config to do the version check.
(AWS, Firebase Remote Config, static json somewhere on the internet)

There reason that it should not be returned from a status call from the api is that the api can be down. But the version check is required for a the next update. So best to seperate these 2 things on a seperate endpoint/server

I always use the buildNr (1) instead of the version name (1.0.0). This is because buildNr should always be incremented on android. To keep it simple I use the same on iOS.

pseudo code:

```
if (remoteConfig.minBuildNr > buildNr) {
  // show update dialog
  return;
}
if (remoteConfig.latestBuildNr > buildNr) {
   // show now blocking update UI
}
```

Using firebase also results in easier maintenance of your remote config. To set a config for android & iOS specificly & even make a difference in flavor.

## Mobile Demo

<div align="center">
  <img src="https://raw.githubusercontent.com/vanlooverenkoen/lifepowr-flexio/master/github-images/img_1.png" width="200" height="350" alt="Image 1">
  <img src="https://raw.githubusercontent.com/vanlooverenkoen/lifepowr-flexio/master/github-images/img_2.png" width="200" height="350" alt="Image 2">
  <img src="https://raw.githubusercontent.com/vanlooverenkoen/lifepowr-flexio/master/github-images/img_3.png" width="200" height="350" alt="Image 3">
  <br>
  <img src="https://raw.githubusercontent.com/vanlooverenkoen/lifepowr-flexio/master/github-images/img_4.png" width="200" height="350" alt="Image 4">
  <img src="https://raw.githubusercontent.com/vanlooverenkoen/lifepowr-flexio/master/github-images/img_5.png" width="200" height="350" alt="Image 5">
  <img src="https://raw.githubusercontent.com/vanlooverenkoen/lifepowr-flexio/master/github-images/img_6.png" width="200" height="350" alt="Image 6">
</div>