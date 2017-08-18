# Mobicast

### Introduction
Mobicast provides an iOS SDK that can very straightforwardly be plugged into an existing iOS mobile application to show popular video content alongside targeted advertising. The SDK makes use of the Mobicast API and fetches player configuration and video playlist details using exactly the same mechanism.  In the same way as the API, the Mobicast Account Team will provision a player token to use when configuring the SDK.

### Functionality
Once implemented, a video marquee of content from the configured playlist is shown at the bottom of the view that initialises the SDK control:

<img src="https://media-api.atlassian.io/file/68cbd6ee-d085-430d-8303-2f659b854e3e/image?mode=full-fit&client=97cd3ed9-999a-4470-bc0f-e348dd28368c&token=eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI5N2NkM2VkOS05OTlhLTQ0NzAtYmMwZi1lMzQ4ZGQyODM2OGMiLCJhY2Nlc3MiOnsidXJuOmZpbGVzdG9yZTpmaWxlOjY4Y2JkNmVlLWQwODUtNDMwZC04MzAzLTJmNjU5Yjg1NGUzZSI6WyJyZWFkIl19LCJleHAiOjE1MDMwNDcyNTgsIm5iZiI6MTUwMzA0Mzg5OH0.0sxUiOKCXpt4C8Zq9m8i6b67qVC2KVdctswStSPPD98" width="350">

Clicking on a video opens the video in play mode within a scrollable control that allows the user to straightforwardly navigate through the available content:

<img src="https://media-api.atlassian.io/file/019d621e-9774-499d-8028-ebcdd3399f0a/image?mode=full-fit&client=97cd3ed9-999a-4470-bc0f-e348dd28368c&token=eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI5N2NkM2VkOS05OTlhLTQ0NzAtYmMwZi1lMzQ4ZGQyODM2OGMiLCJhY2Nlc3MiOnsidXJuOmZpbGVzdG9yZTpmaWxlOjAxOWQ2MjFlLTk3NzQtNDk5ZC04MDI4LWViY2RkMzM5OWYwYSI6WyJyZWFkIl19LCJleHAiOjE1MDMwNDcyMTYsIm5iZiI6MTUwMzA0Mzg1Nn0.uaCuRIHWbEhqErNAGgoQo5wFeU7UxU-R2SCY-7GmGC8" width="350">
 
Pre-roll and mid roll advertising is shown as configured for this player token.
<img src="https://media-api.atlassian.io/file/23a46838-a1c4-4c7d-9f58-8d2cf6ede9d9/image?mode=full-fit&client=97cd3ed9-999a-4470-bc0f-e348dd28368c&token=eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI5N2NkM2VkOS05OTlhLTQ0NzAtYmMwZi1lMzQ4ZGQyODM2OGMiLCJhY2Nlc3MiOnsidXJuOmZpbGVzdG9yZTpmaWxlOjIzYTQ2ODM4LWExYzQtNGM3ZC05ZjU4LThkMmNmNmVkZTlkOSI6WyJyZWFkIl19LCJleHAiOjE1MDMwNDcyODQsIm5iZiI6MTUwMzA0MzkyNH0.30uKjnHtork9hkEXzci60zqOKOxJfFlpwAES4vmunLM" width="350">

All of the runtime configuration for the SDK is loaded dynamically from the Mobicast management console, allowing playlists, content and ad integration to be updated at runtime.

### Requirements

XCode 6 or newer  
iOS 8.0+  
CocoaPods  

### Installation Instructions

Mobicast is available through CocoaPods (CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects - [http://cocoapods.org](http://cocoapods.org) for more details. To install the SDK, simply add the following line to your Podfile:

```ruby
pod "Mobicast"
```

### Usage

In your viewController, first import the IOS SDK library:

```swift
import Mobicast
```

Then you need to initialize the SDK at the start of the `AppDelegate`.


```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
// Override point for customization after application launch.
 
MobicastSDK.setup()
 
return true
}
```

To embed the player in your view controller, you just need to write the code below passing the player token that you have been given by the Mobicast Account Team:

```swift
var discovery: DiscoveryWidget?
 
override func viewDidLoad() {
super.viewDidLoad()
 
discovery = DiscoveryWidget.init(showInViewController: self, playerToken:"102")
}```

To open the playlist in a separate window, add the code below passing the player token and referencing your navigationController.

```swift
var discovery: DiscoveryPlaylist?
 
override func viewDidLoad() {
super.viewDidLoad()
 
discovery = DiscoveryPlaylist.init(showInNavigationController: self.navigationController!, playerToken: "102")
}
```
For correct work of the framework, you need to add `UIViewControllerBasedStatusBarAppearance` in your application's `Info.plist` and set it to Type: Boolean and Value: NO.

### Analytics
Like and Share tracking, as well as detailed video view information by unique device identifier (IDFA), device type, location and many other properties are available both via our reporting system and our realtime dashboard API

### License

The Mobicast IOS SDK is available under the MIT license (https://opensource.org/licenses/MIT). See the LICENSE file for more info.
