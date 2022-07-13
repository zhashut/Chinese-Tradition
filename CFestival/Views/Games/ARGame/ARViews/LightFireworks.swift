//
//  LightFireworks.swift
//  CFestival
//
//  Created by yu cui on 2022/6/30.
//

import SwiftUI
import RealityKit

struct LightFireworks: UIViewControllerRepresentable {
    typealias UIViewControllerType = LightFireworksViewController
    
    func makeUIViewController(context: Context) -> LightFireworksViewController {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "lightAR") as? LightFireworksViewController
        return vc!
    }
    
    func updateUIViewController(_ uiViewController: LightFireworksViewController, context: Context) {
        
    }
    
}

struct LightFireworks_Previews: PreviewProvider {
    static var previews: some View {
        LightFireworks()
    }
}
