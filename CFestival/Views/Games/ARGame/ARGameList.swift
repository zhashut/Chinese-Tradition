//
//  ARGameList.swift
//  CFestival
//
//  Created by zhashut on 2022/6/24.
//

import SwiftUI

struct ARGameList: View {
    @State var isShow: Bool = false
    
    var body: some View {
        List(favoritearData) { favoritear in 
            Button {
                self.isShow = true
            } label: {
                ARGameRow(favoriteRow: favoritear)
            }
            .fullScreenCover(isPresented: $isShow) {
                ARGameView(selectedAR: favoritear.game)
            }
        }
            .listStyle(.inset)
    }
}

struct ARGameList_Previews: PreviewProvider {
    static var previews: some View {
        ARGameList()
    }
}
