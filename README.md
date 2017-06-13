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

At first you need to import the library.

```ruby
import Mobicast
```

To display the player in your view controller, you just need to write the code.

```ruby
var discovery: DiscoveryWidget?

override func viewDidLoad() {
super.viewDidLoad()

discovery = DiscoveryWidget.init(showInViewController: self, playerToken:"102")
}
```
Where ```viewController``` is your view controller where the player will be displayed. And your ```playerToken```.


To open the playlist in a separate window.

```ruby
var discovery: DiscoveryPlaylist?

override func viewDidLoad() {
super.viewDidLoad()

discovery = DiscoveryPlaylist.init(showInNavigationController: self.navigationController!, playerToken: "102")
}
```
Where ```navigationController``` is your navigation controller from which the transition will be made. And your ```playerToken```.


### License

Mobicast is available under the MIT license. See the LICENSE file for more info.
