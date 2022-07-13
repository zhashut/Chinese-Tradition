//
//  FestivalContentView.swift
//  CFestival
//
//  Created by zhashut on 2022/6/20.
//

import SwiftUI

// 简介视图
struct SynopsisView: View {
    var synopsis = FestivalData.shared().allFestivals()[0].festivalContent.synopsis
    var contentImag: String = FestivalData.shared().allFestivals()[0].image
    @State var isSpeaking: Bool = false
    @State var count: Int = -1
    var voicebroadcast = Voicebroadcast()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
      ScrollView {
        VStack {
            Image(contentImag)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 150, alignment: .center)
            .padding(.top, 25)
            .padding(.bottom, 5)
            
            HStack {
                Spacer()
                Button {
                    self.isSpeaking.toggle()
                    count += 1
                    voicebroadcast.speak(content: synopsis)
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
                .offset(x: -30, y: 15)
            }
           
            Text(synopsis)
            .font(Font.custom("WenYue_SXSDiaoYuShaoTi_JF", size: 15))
            .foregroundColor(.black)
            .lineSpacing(5)
            .padding()

            Spacer()

        }
      }
      .background(
        Image("FavoriteBackground")
          .resizable()
      )
    }
}

// 起源视图
struct OriginView: View {
    var origin = FestivalData.shared().allFestivals()[0].festivalContent.origin
    var contentImag: String = FestivalData.shared().allFestivals()[0].image
    @State var isSpeaking: Bool = false
    @State var count: Int = -1
    var voicebroadcast = Voicebroadcast()
    
    var body: some View {
      ScrollView {
        VStack {
            Image(contentImag)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 150, alignment: .center)
            .padding(.top, 25)
            .padding(.bottom, 8)

            HStack {
                Spacer()
                Button {
                    self.isSpeaking.toggle()
                    count += 1
                    voicebroadcast.speak(content: origin)
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
                .offset(x: -30, y: 15)
            }

            Text(origin)
            .font(Font.custom("WenYue_SXSDiaoYuShaoTi_JF", size: 15))
            .foregroundColor(.black)
            .lineSpacing(5)
            .padding()

            Spacer()
        }
      }
      .background(
        Image("FavoriteBackground")
          .resizable()
      )

    }
}

// 习俗视图
struct CustomView: View {
    var custom = FestivalData.shared().allFestivals()[0].festivalContent.custom
    var contentImag: String = FestivalData.shared().allFestivals()[0].image
    @State var isSpeaking: Bool = false
    @State var count: Int = -1
    var voicebroadcast = Voicebroadcast()
    
    var body: some View {
      ScrollView {
        VStack {
          Image(contentImag)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 150, alignment: .center)
            .padding(.top, 25)
            .padding(.bottom, 8)

            HStack {
                Spacer()
                Button {
                    self.isSpeaking.toggle()
                    count += 1
                    voicebroadcast.speak(content: custom)
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
                .offset(x: -30, y: 15)
            }
            
          Text(custom)
            .font(Font.custom("WenYue_SXSDiaoYuShaoTi_JF", size: 15))
            .foregroundColor(.black)
            .lineSpacing(5)
            .padding()

          Spacer()
        }
      }
      .background(
        Image("FavoriteBackground")
          .resizable()
      )

    }
}

// 诗歌视图
struct PoetryView: View {
    var poetry = FestivalData.shared().allFestivals()[0].festivalContent.poetry
    var contentImag: String = FestivalData.shared().allFestivals()[0].image
    @State var isSpeaking: Bool = false
    @State var count: Int = -1
    var voicebroadcast = Voicebroadcast()
    
    var body: some View {
      ScrollView {
        VStack {
          Image(contentImag)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 150, alignment: .center)
            .padding(.top, 25)
            .padding(.bottom, 8)

            HStack {
                Spacer()
                Button {
                    self.isSpeaking.toggle()
                    count += 1
                    voicebroadcast.speak(content: poetry)
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
                .offset(x: -30, y: 15)
            }
            
          Text(poetry)
            .font(Font.custom("WenYue_SXSDiaoYuShaoTi_JF", size: 15))
            .foregroundColor(.black)
            .lineSpacing(5)
            .padding()

          Spacer()
        }
      }
      .background(
        Image("FavoriteBackground")
          .resizable()
      )

    }
}
struct FestivalContentView_Previews: PreviewProvider {
    static var previews: some View {
        SynopsisView()
    }
}
