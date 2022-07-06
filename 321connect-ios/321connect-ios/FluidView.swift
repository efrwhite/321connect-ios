//
//  FluidView.swift
//  321connect-ios
//
//  Created by Edward Ladia on 6/17/22.
//

import Foundation
import UIKit

class FluidView: UIView {
    
    @IBOutlet weak var fluidMeasureButton: UIButton!
    @IBOutlet weak var fluidModeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notesTextField: UITextView!
    
    let transparentView = UIView()
    
    
    
    func addTransparentView() {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.frame
        self.addSubview(transparentView)
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        
        //animation
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: { self.transparentView.alpha = 0.5}, completion: nil)
    }
    
    @objc func removeTransparentView() {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: { self.transparentView.alpha = 0.0}, completion: nil)
    }
    
    @IBAction func fluidMeasureTapped(_ sender: Any) {
        addTransparentView()
    }
    
    @IBAction func fluidModeTapped(_ sender: Any) {
        addTransparentView()
    }
}
