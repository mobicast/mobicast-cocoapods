import UIKit

class UIViewControllerExtension: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.setupNavigationBur()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    /**
     * Setup navigation bar.
     */
    func setupNavigationBur() {

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.5764705882, blue: 0.9333333333, alpha: 1)
        navigationBarTitleView()
        setupBackButton()

    }

    /**
     * Setup navigation bar title.
     */
    func navigationBarTitleView() {

        let container = UIView.init()
        container.frame = CGRect(x: 0, y: 0, width: 130, height: 22)

        let icon = UIImageView.init(image: UIImage(named: "splashScreenWhitePlayIcon"))

        icon.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(icon)
        container.addConstraint(NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: icon, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0))
        container.addConstraint(NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: icon, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0))
        container.addConstraint(NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: icon, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0))

        icon.addConstraint(NSLayoutConstraint(item: icon, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 22))
        icon.addConstraint(NSLayoutConstraint(item: icon, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20))

        let titleLabel = UILabel.init()

        titleLabel.text = "MOBICAST"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 19)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(titleLabel)
        container.addConstraint(NSLayoutConstraint(item: icon, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: titleLabel, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: -3))
        container.addConstraint(NSLayoutConstraint(item: icon, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: titleLabel, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
        container.addConstraint(NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: titleLabel, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0))

        self.navigationItem.titleView = container
    }

    /**
     * Setup back button.
     */
    func setupBackButton() {

        if (navigationController?.viewControllers.count)! > 1 {

            let button = UIButton.init(type: UIButtonType.custom)
            button.setImage(UIImage(named: "back_chevron"), for: UIControlState.normal)
            button.sizeToFit()
            button.addTarget(self, action: #selector(self.didSelectBackButton), for: UIControlEvents.touchUpInside)
            let buttonItem = UIBarButtonItem.init(customView: button)
            self.navigationItem.hidesBackButton = true
            self.navigationItem.leftBarButtonItem = buttonItem
        } else {

            self.navigationItem.hidesBackButton = true
            self.navigationItem.leftBarButtonItem = nil
        }
    }

    /**
     * Back button action.
     */
    open func didSelectBackButton() {

        self.navigationController?.popViewController(animated: true)
    }
}
