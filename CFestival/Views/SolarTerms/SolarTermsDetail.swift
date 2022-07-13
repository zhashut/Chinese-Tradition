//
//  UpdateDetail.swift
//  FestivalAR
//
//  Created by zhashut on 2022/6/9.
//

import SwiftUI

struct SolarTermsDetail: View {
    @State var allSolarTerms: [SolarTerms] = SolarTermsData.shared().allSolarTerms()
    var solarTerms : SolarTerms
    @State var showFavoriteButton: Bool = true  // 显示收藏按钮（生成截屏时，这个按钮与modelData绑定，截屏会出错，所以截屏时要隐藏）
    @State var isSpeaking: Bool = false
    @State var count: Int = -1
    var voicebroadcast = Voicebroadcast()
    
  
    var solarTermsIndex: Int {
        allSolarTerms.firstIndex(where: {$0.id == solarTerms.id})!
    }
    
    // 用于截屏的视图（不能包含FavoriteButton按钮）
    var screenShotBody: some View {
        ScrollView {
          VStack(spacing: 20.0) {
            HStack {
              // 标题
              Text(solarTerms.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            }

            // 图片
            Image(solarTerms.image)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(height: 200)
            // 内容
            Text(solarTerms.text)
              .lineLimit(nil)
              .frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading)

            Spacer()

          }
          .padding(30.0)
        }
    }

    // Body视图
    var body: some View {
      ScrollView {
        VStack(spacing: 20.0) {
          HStack {
            // 标题
            Text(solarTerms.title)
              .font(.largeTitle)
              .fontWeight(.heavy)
              
              if showFavoriteButton {
                  FavoriteButton(isSet: $allSolarTerms[solarTermsIndex].isFavorite)
                  let success = SolarTermsData.shared().save(allSolarTerms)
              }
          }

          // 图片
          Image(solarTerms.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
            
            HStack {
                Spacer()
                Button {
                    self.isSpeaking.toggle()
                    count += 1
                    voicebroadcast.speak(content: solarTerms.text)
                } label: {
                    if count == -1 {
                        Text(!isSpeaking ? "语音播报" : "暂停播报")
                    } else {
                        Text(!isSpeaking ? "继续播报" : "暂停播报")
                    }
                }
                .foregroundColor(.blue)
                .onDisappear {
                    voicebroadcast.stop()
                }
                .offset(x: -18)
            }
            
          // 内容
          Text(solarTerms.text)
            .lineLimit(nil)
            .frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading)

          Spacer()

        }
        .padding(30.0)
      }
      .toolbar {
        ShareButton(detailImag: screenShotBody.takeScreenshot())
      }
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        SolarTermsDetail(solarTerms: SolarTermsData().allSolarTerms()[0])
    }
}
