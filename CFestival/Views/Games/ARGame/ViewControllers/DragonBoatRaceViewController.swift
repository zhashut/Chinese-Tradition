//
//  DragonBoatRaceViewController.swift
//  CFestival
//
//  Created by yu cui on 2022/6/30.
//

import UIKit
import RealityKit
import ARKit
import SwiftUI

class DragonBoatRaceViewController: UIViewController, ARSessionDelegate {
    
    @IBOutlet var arView: ARView!
    var activityView: UIActivityIndicatorView!
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityView = UIActivityIndicatorView(style: .large)
        activityView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        activityView.center = arView.center
        activityView.color = .red
        activityView.hidesWhenStopped = true
        arView.addSubview(activityView)

        backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 9, y: 12, width: 18, height: 18)
        // MARK: 找一个自带颜色的图片按钮
        backButton.setImage(UIImage(named: "回退按钮")?.withTintColor(.blue), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped(sender:)), for: .touchUpInside)
        arView.addSubview(backButton)

        activityView.startAnimating()

        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! 赛龙舟.load场景()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        activityView.stopAnimating()
    }
    
    @objc func backButtonTapped(sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

