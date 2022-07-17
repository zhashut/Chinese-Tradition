//
//  PoetryGameList.swift
//  CFestival
//
//  Created by 李婉玲 on 2022/7/7.
//

import SwiftUI

struct PoetryGameList: View {
    @State var isShow: Bool = false
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
            List(modelData.poetrys) { poetry in
                Button {
                    isShow = true
                } label: {
                    PoetryGameRow(poetry: poetry)
                }
                .fullScreenCover(isPresented: $isShow) {
                    PoetryGameView(selectedPoetry: poetry.game)
                }
            }
            .listStyle(.inset)
    }
}

struct PoetryGameList_Previews: PreviewProvider {
    static var previews: some View {
        PoetryGameList()
            .environmentObject(ModelData())
    }
}
