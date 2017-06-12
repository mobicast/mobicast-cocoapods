import UIKit

class BootPageViewController: UIViewController {

    @IBOutlet weak var shapeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        setplayShapeImage()

        openNextPage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    internal func openNextPage() {

        let deadlineTime = DispatchTime.now() + .seconds( 2 )
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {

            self.performSegue(withIdentifier: "listSeque", sender: self)
        }
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
     * Setup shape around play button.
     */
    internal func setplayShapeImage() {

        let bezierPath = UIBezierPath()
        let arcCenter = CGPoint(x: shapeImageView.frame.size.width / 2.0, y: shapeImageView.frame.size.height / 2.0)
        bezierPath.addArc(withCenter: arcCenter, radius: 28, startAngle: CGFloat(-90 * Double.pi / 180), endAngle: CGFloat(270 * Double.pi / 180), clockwise: true)

        let shapeLayer = CAShapeLayer()

        shapeLayer.path = bezierPath.cgPath

        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 19
        shapeLayer.frame = CGRect(x: 0, y: 0, width: shapeImageView.frame.size.width, height: shapeImageView.frame.size.height)

        shapeImageView.layer.mask = shapeLayer

        let duration = 4.0

        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.beginTime = 0
        animateStrokeEnd.duration = CFTimeInterval(duration / 2.0)
        animateStrokeEnd.fromValue = 0
        animateStrokeEnd.toValue = 1
        animateStrokeEnd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

        let animateStrokeStart = CABasicAnimation(keyPath: "strokeStart")
        animateStrokeStart.beginTime = CFTimeInterval(duration / 2.0)
        animateStrokeStart.duration = CFTimeInterval(duration / 2.0)
        animateStrokeStart.fromValue = 0
        animateStrokeStart.toValue = 1
        animateStrokeStart.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

        let animateRotation = CABasicAnimation(keyPath: "transform.rotation.z")
        animateRotation.fromValue = 0
        animateRotation.toValue = .pi * 2.0
        animateRotation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animateRotation.repeatCount = Float.infinity

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animateStrokeEnd, animateStrokeStart, animateRotation]
        animationGroup.duration = CFTimeInterval(duration)
        animationGroup.fillMode = kCAFillModeBoth
        animationGroup.isRemovedOnCompletion = false
        animationGroup.repeatCount = Float.infinity

        shapeLayer.add(animationGroup, forKey: "loading")
    }

}
