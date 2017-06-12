import UIKit
import Mobicast

class ViewController: UIViewControllerExtension {

    var discovery: DiscoveryWidget?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        addMobicast()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addMobicast() {

        discovery = DiscoveryWidget.init(viewController: self, playerToken:"102")

        discovery?.developerMode = true

    }

}
