//
//  MainView.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/11.
//

import SwiftUI

struct MainView: View {
  @State var show = false
  @State var showProfile = false

    var body: some View {
      TabView {
        FestivalList().tabItem {
          Image(systemName: "leaf")
          Text("节日")
        }
        .tag(1)

        SolarTermsList().tabItem {
          Image(systemName: "wind")
          Text("节气")
        }
        .tag(2)

        GameView().tabItem {
          Image(systemName: "gamecontroller")
          Text("游戏")
        }
        .tag(3)
          
        AccountView(profile: Profile.default).tabItem {
          Image(systemName: "person.crop.circle")
          Text("我的")
        }
        .tag(4)
      }
      .edgesIgnoringSafeArea(.top)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        .environmentObject(ModelData())
        
        MainView()
        .environmentObject(ModelData())
        .preferredColorScheme(.dark)
    }
}
