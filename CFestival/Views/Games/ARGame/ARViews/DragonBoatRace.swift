//
//  DragonBoatRace.swift
//  CFestival
//
//  Created by yu cui on 2022/6/27.
//

import SwiftUI
import RealityKit

struct DragonBoatRace: UIViewControllerRepresentable {
    typealias UIViewControllerType = DragonBoatRaceViewController
    
    func makeUIViewController(context: Context) -> DragonBoatRaceViewController {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dragonAR") as? DragonBoatRaceViewController
        return vc!
    }
    
    func updateUIViewController(_ uiViewController: DragonBoatRaceViewController, context: Context) {
    }
    
}

struct DragonBoatRace_Previews: PreviewProvider {
    static var previews: some View {
        DragonBoatRace()
    }
}
