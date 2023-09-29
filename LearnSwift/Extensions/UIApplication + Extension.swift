//
//  UIApplication + Extension.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 29.09.2023.
//

import Foundation
import UIKit

extension UIApplication {
    
    func popToMainVC() {
        let snapShot = UIView()
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            let mainVC = UINavigationController(rootViewController: ViewController())
            scene.window?.rootViewController = mainVC
            UIView.transition(
                with: scene.window!,
                    duration: 0.5,
                    options: .transitionCrossDissolve,
                    animations: {
                        snapShot.transform = CGAffineTransform(translationX: 0, y: snapShot.frame.height)
                    },
                    completion: { status in
                        snapShot.removeFromSuperview()
                    }
                )
        }
    }
    
}
