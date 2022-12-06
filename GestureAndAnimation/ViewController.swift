//
//  ViewController.swift
//  GestureAndAnimation
//
//  Created by David Svensson on 2022-12-06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var singleTapRecognizer: UITapGestureRecognizer!
    
    @IBOutlet var doubleTapRecognizer: UITapGestureRecognizer!
    
    @IBOutlet weak var gestureNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleTapRecognizer.require(toFail: doubleTapRecognizer)
        
        
    }

    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        showGesture(name: "tap")
    }
    
    
    @IBAction func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        showGesture(name: "double tap")
    }
    

    func showGesture(name: String) {
        gestureNameLabel.text = name
    
        
        UIView.animate(withDuration: 1, animations: {  self.gestureNameLabel.alpha = 1.0 }, completion: fadeOutLabel(finished:))
        
       // print(name)
        
    }
    
    func fadeOutLabel(finished: Bool) {
        
        UIView.animate(withDuration: 1, animations: {
            self.gestureNameLabel.alpha = 0.1
        })
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            showGesture(name: "Shake")
        }
    }
    
    
}

