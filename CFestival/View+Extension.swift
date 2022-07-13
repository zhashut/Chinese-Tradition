//
//  View+Extension.swift
//  CFestival
//
//  Created by YinXt on 2022/6/20.
//

import Foundation
import SwiftUI

extension View {
    func takeScreenshot() -> UIImage {
        let window = UIWindow(frame: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
        let hosting = UIHostingController(rootView: self)
        hosting.view.frame = window.frame
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        return hosting.view.screenShot()
    }
}

extension UIView {
    func screenShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, true, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        self.layer.render(in: context!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
