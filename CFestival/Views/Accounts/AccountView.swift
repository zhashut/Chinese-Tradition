//
//  AccountView.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/17.
//

import SwiftUI

struct AccountView: View {
    @State var isDelete: Bool = false
    @State var isPinned: Bool = false
    @State var isShow: Bool = false
    @State var isShowFavorite: Bool = false
    @State var profile: Profile
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    @EnvironmentObject var modelData: ModelData
    @State var allWebs: [Web] = []

    var body: some View {
      NavigationView {
        List {

          profilePark

          menu

          link
        }
        .listStyle(.insetGrouped)
        .navigationTitle("我的信息")
        .onAppear {
          // 每次显示视图时，重新获取持久化的Emojis数组，赋值给List数据源数组
          allWebs = WebData.shared().allWebs()
        }
          
          // 这个提示只会在iPad运行App时显示，用iPhone运行时不显示
          Text("选择一个菜单")
      }
    }

  // 创建出一个单独的部件视图，更加简洁也更加明了和容易维护
  var profilePark: some View {
    VStack(spacing: 8) {
        Image(uiImage: profile.photo)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 75)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 2)
            }
            .shadow(radius: 7)
            .background(
              Image(systemName: "hexagon")
                .symbolVariant(.fill)
                .foregroundColor(profile.bgColor)
                .font(.system(size: 200))
                .offset(x: -39, y: -105)
            )
        Text(profile.username)
            .font(.title.weight(.semibold))
            .foregroundColor(.primary)
        HStack {
            Image(systemName: "location")
            Text(profile.location)
              .foregroundStyle(.secondary)
        }
        .foregroundColor(.primary)
    }
    // 设置为最大宽度，这样可以图标居中
    .frame(maxWidth: .infinity)
    .padding()
  }

  var menu: some View {
    // 分块
    Section {
      Button(action: {
        self.isShow.toggle()
        if isShow {
          editMode?.animation().wrappedValue = .inactive
        } else {
          editMode?.animation().wrappedValue = .active
        }
      }) {
        HStack {
          Label("设置", systemImage: "gear")
          Spacer()
          Image(systemName: "chevron.right")
            .font(.system(size: 13.5))
            .foregroundColor(.secondary)
        }
          .sheet(isPresented: $isShow) {
            AccountEditor(profile: $draftProfile)
              .onAppear {
                // 获取里面的数据
                draftProfile = profile
                modelData.profiles.photo = profile.photo
              }
              .onDisappear {
                // 外面的数据
                profile = draftProfile
                profile.location = modelData.profiles.location
              }
          }
      }

      Button {
        self.isShowFavorite.toggle()
      } label: {
        HStack {
          Image(systemName: "star.fill")
              .foregroundColor(.yellow)
          Text("我的收藏")
          Spacer()

         Image(systemName: "chevron.right")
           .font(.system(size: 13.5))
           .foregroundColor(.secondary)
        }
        .sheet(isPresented: $isShowFavorite) {
          FavoriteView()
        }
      }

      NavigationLink {
        HelpView()
      } label: {
        Label("帮助", systemImage: "questionmark")
      }

    }
    .foregroundColor(.primary)
    // 分隔线变蓝色
    .listRowSeparatorTint(.blue)
    // 隐藏分隔线
    .listRowSeparator(.hidden)
  }

  var link: some View {
    Section {
      NavigationLink {
        WebAdd()
      } label: {
        Text("添加")
          .foregroundColor(Color.blue)
      }
      ForEach(allWebs) { web in
        WebRow(web: web)
      }
      .onDelete { indexSet in
        allWebs.remove(atOffsets: indexSet)
          // 持久性保存
          let success = WebData.shared().save(allWebs)
          if success {
              print("删除成功")
          }
          else {
              print("删除失败")
          }
      }

    }
    .listRowSeparator(.hidden)
    .accentColor(.primary)
  }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
      AccountView(profile: Profile.default)
        .environmentObject(ModelData())
    }
}
