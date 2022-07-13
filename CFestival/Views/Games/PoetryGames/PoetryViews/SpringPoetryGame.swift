//
//  PoetryGame.swift
//  CFestival
//
//  Created by zhashut on 2022/7/7.
//

import SwiftUI

struct SpringPoetryGame: View {
    var poetry: Poetry = poetryData[0]
    @State var fillPoetry: [String] = []
    @State var str: String = ""
    @State var showAlert: Bool = false // 通关成功
//    @State var loseAlert: Bool = false // 通关失败
    @State var recall: Bool = false // 撤回
    @State var reset: Bool = false // 重置
    @Environment(\.dismiss) var dismiss // 环境变量
    @EnvironmentObject var modelData: ModelData

    
    var body: some View {
        ScrollView {
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
                
                Image("春节")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 150, alignment: .center)
                .padding(.top, 25)
                .padding(.bottom, 5)
                
                HStack {
                    Button {
                        tapMusic?.play()
                        if fillPoetry.count > 0 {
                            str.remove(at: str.index(before: str.endIndex))
                            fillPoetry.remove(at: fillPoetry.endIndex - 1)
                        }
                    } label: {
                        Text("撤回")
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Button {
                        tapMusic?.play()
                        str.removeAll()
                        fillPoetry.removeAll()
                    } label: {
                        Text("重置")
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                
                    Button {
                        let fillPoetryArray: NSArray = fillPoetry as NSArray
                        let strFillPoetry = fillPoetryArray.componentsJoined(by: "") as String
                        if (strFillPoetry.elementsEqual(poetry.resultPoetry)) {
                            showAlert = true
                            modelData.poetrys[0].isVictory = true
                            victoryMusic?.play()
                            // 自动回退
//                            dismiss()
                        } else {
                            errorMusic?.play()
                        }
                        
//                        dismiss()
                    } label: {
                        Text("完成")
                            .foregroundColor(.blue)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title:  Text("恭喜,挑战成功😄！"))
                    }
//                    .alert(isPresented: $loseAlert) {
//                        Alert(title: Text("很遗憾,挑战失败💔"))
//                    }
                }
                .padding()

                VStack(alignment: .center) {
                    Text("元日")
                    Text("〔宋〕王安石")
                    Text("      爆竹声中一岁除，")
                    Text("      春风送暖入屠苏。")
                    HStack {
                        Text("    " + str)
                    }
                   
                }
                .frame(height: 180)
                .foregroundColor(.black)
                
                HStack {
                    ForEach(cuijie, id: \.self) { item in
                        Button {
                            tapMusic?.play()
                            if fillPoetry.count < poetry.resultPoetry.count {
                                fillPoetry.append(item)
                                jointPoetry(poetrystr: item)
                            }
                        } label: {
                            Text(item)
                        }
                    }
                }
            }
            
        }
        .onAppear {
            initAll()
            backgroundMusic?.play()
        }
        .onDisappear {
            backgroundMusic?.stop()
        }
        .background(
          Image("FavoriteBackground")
            .resizable()
        )
    }
    
    func jointPoetry(poetrystr: String) -> String {
         str += poetrystr
        if (str.count == poetry.resultPoetry.count / 2) {
            str += ","
            str += "\n    "
        } else if (str.count == poetry.resultPoetry.count + 6) {
            str += "。"
        }
        return str
    }
}

struct PoetryGame_Previews: PreviewProvider {
    static var previews: some View {
        SpringPoetryGame()
            .environmentObject(ModelData())
    }
}
