//
//  ViewController.swift
//  AnimationApp
//
//  Created by slava on 04.08.2021.
//

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

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var springView: SpringView!
    
    let animations: [Animation] = [
        .shake,
        .slideLeft,
        .pop,
        .flipX,
        .flipY,
        .morph,
        .squeeze,
        .flash,
        .wobble,
        .swing
    ]
    
    @IBAction func startAnimationBtn(_ sender: UIButton) {
        setOptions()
        springView.animate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setOptions() {
        let animation = animations.randomElement()
        
        springView.force = 1
        springView.delay = 0
        springView.duration = 5
        
        springView.animation = animation?.rawValue ?? ""
    }

}

