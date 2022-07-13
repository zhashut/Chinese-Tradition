//
//  Voicebroadcast.swift
//  CFestival
//
//  Created by zhashut on 2022/6/26.
//

import UIKit
import AVFoundation
import SwiftUI

class Voicebroadcast {
    var volumeValue: Float = 1.2 // 播放的音量
    var rateValue: Float = 0.52 // 播放速率
    var pitchValue: Float = 1.0 // 说话音调
    let language = "zh-CN" // 语音
    let synthesizer = AVSpeechSynthesizer()
    
    // 播报方法
    //自訂function區
    func speak(content: String){
        let speechUtterance = AVSpeechUtterance(string: content)
        speechUtterance.volume = volumeValue
        speechUtterance.rate = rateValue
        speechUtterance.pitchMultiplier = pitchValue
        speechUtterance.voice = AVSpeechSynthesisVoice(language:language)
        synthesizer.speak(speechUtterance)
        
        if synthesizer.isSpeaking {
            synthesizer.pauseSpeaking(at: .immediate)
        }
        
        if synthesizer.isPaused {
            synthesizer.continueSpeaking()
        }
    }
    
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
}


