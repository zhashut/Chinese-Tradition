//
//  CoupleMeet.swift
//  CFestival
//
//  Created by yu cui on 2022/6/28.
//

import SwiftUI
import RealityKit

struct CoupleMeet: UIViewControllerRepresentable {
    typealias UIViewControllerType = CoupleMeetViewController
    
    func makeUIViewController(context: Context) -> CoupleMeetViewController {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "coupleAR") as? CoupleMeetViewController
        return vc!
    }
    
    func updateUIViewController(_ uiViewController: CoupleMeetViewController, context: Context) {
        
    }
    
}

struct CoupleMeet_Previews: PreviewProvider {
    static var previews: some View {
        CoupleMeet()
    }
}
