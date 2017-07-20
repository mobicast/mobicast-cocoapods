# Mobicast

### Requirements

XCode 6 or newer  
iOS 8.0+  
CocoaPods  

### Installation Instructions

Mobicast is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Mobicast"
```

Now you can use Mobicast.

### Usage

In those classes where you will use the framework, do the import.

```swift
import Mobicast
```

Then you need to initialize the SDK at the start of the `appdelegate`.


```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
// Override point for customization after application launch.

MobicastSDK.setup()

return true
}
```

To display the player in your view controller, you just need to write the code.

```swift
var discovery: DiscoveryWidget?

override func viewDidLoad() {
super.viewDidLoad()

discovery = DiscoveryWidget.init(showInViewController: self, playerToken:"102")
}
```
Where `viewController` is your view controller where the player will be displayed. And your `playerToken`.


To open the playlist in a separate window.

```swift
var discovery: DiscoveryPlaylist?

override func viewDidLoad() {
super.viewDidLoad()

discovery = DiscoveryPlaylist.init(showInNavigationController: self.navigationController!, playerToken: "102")
}
```
Where `navigationController` is your navigation controller from which the transition will be made. And your `playerToken`.

For correct work of the framework, you need to add `UIViewControllerBasedStatusBarAppearance` in your application's `Info.plist` and set it to Type: Boolean and Value: `NO`.

### License

Mobicast is available under the MIT license. See the LICENSE file for more info.
