//
//  ARGameView.swift
//  CFestival
//
//  Created by yu cui on 2022/6/26.
//

import SwiftUI

struct ARGameView: View {
    @State var selectedAR: ARGame
    @Environment(\.dismiss) var dismiss // 环境变量
    
    var body: some View {
            switch selectedAR {
            case .春节:
                LightFireworks()
            case .端午:
                DragonBoatRace()
            case .七夕:
                CoupleMeet()
            case .默认:
                VStack {
                    HStack {
                        Button {
                            backgroundMusic?.stop()
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                                .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("开发小弟正在连夜赶进度.....")
                            .font(.headline)
                    }
                    Spacer()
                }
        }
    }
}

struct ARGameView_Previews: PreviewProvider {
    static var previews: some View {
        ARGameView(selectedAR: .春节)
    }
}
