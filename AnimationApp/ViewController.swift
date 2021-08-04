

import Spring

enum Animation: String, CaseIterable {
    case shake = "shake"
    case slideLeft = "slideLeft"
    case pop = "pop"
    case flipX = "flipX"
    case flipY = "flipY"
    case morph = "morph"
    case squeeze = "squeeze"
    case flash = "flash"
    case wobble = "wobble"
    case swing = "swing"
}

enum AnimationCurve: String, CaseIterable {
    case easeIn = "easeIn"
    case easeOut = "easeOut"
    case easeInOut = "easeInOut"
    case linear = "linear"
    case spring = "spring"
    case easeInSine = "easeInSine"
    case easeOutSine = "easeOutSine"
    case easeInOutSine = "easeInOutSine"
    case easeInQuad = "easeInQuad"
}

class ViewController: UIViewController {

    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var springView: SpringView!
    @IBOutlet private weak var animationButton: UIButton!
    
    private var animation: Animation!
    private var curve: AnimationCurve!
    
    private let animations = Animation.allCases
    private let animationCurve = AnimationCurve.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomAnimation()
        setOptions()
        animationButton.setTitle("Start \(animation.rawValue)", for: .normal)
    }
    
    @IBAction func startAnimationBtn(sender: UIButton) {
        setOptions()
        springView.animate()
        setRandomAnimation()
        sender.setTitle(animation.rawValue, for: .normal)
    }
    
    private func setRandomAnimation() {
        animation = animations.randomElement()
        curve = animationCurve.randomElement()
    }
    
    private func setOptions() {
        springView.force = CGFloat.random(in: 0.1...3.0)
        springView.delay = CGFloat.random(in: 0.1...1.0)
        springView.duration = CGFloat.random(in: 1.0...7.0)
        springView.velocity = CGFloat.random(in: 1.0...3.0)
        springView.animation = animation?.rawValue ?? ""
        springView.curve = curve?.rawValue ?? ""
        setLabel()
    }
    
    private func setLabel() {
        infoLabel.text = """
animation: \(springView.animation)
curve: \(springView.curve)
force: \(Float(springView.force))
duration: \(Float(springView.duration))
velocity: \(Float(springView.velocity))
delay: \(Float(springView.delay))
"""
    }
}

