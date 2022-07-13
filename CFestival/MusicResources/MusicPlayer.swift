//
//  MusicPlayer.swift
//  CFestival
//
//  Created by 李婉玲 on 2022/7/7.
//

import Foundation

import Foundation
import AVFoundation


var backgroundMusic: AVAudioPlayer?
var tapMusic: AVAudioPlayer?
var correctMusic: AVAudioPlayer?
var errorMusic: AVAudioPlayer?
var victoryMusic: AVAudioPlayer?

let bgmPath = Bundle.main.path(forResource: "bgm", ofType: "mp3")!
let clickPath = Bundle.main.path(forResource: "click", ofType: "mp3")!
let correctPath = Bundle.main.path(forResource: "correct", ofType: "mp3")!
let errorPath = Bundle.main.path(forResource: "error", ofType: "mp3")!
let victoryPath = Bundle.main.path(forResource: "victory", ofType: "mp3")!

let bgmUrl = URL(fileURLWithPath: bgmPath)
let clickUrl = URL(fileURLWithPath: clickPath)
let correctUrl = URL(fileURLWithPath: correctPath)
let errorUrl = URL(fileURLWithPath: errorPath)
let victoryUrl = URL(fileURLWithPath: victoryPath)

func initAll() {
    backgroundMusic = try? AVAudioPlayer(contentsOf: bgmUrl)
    backgroundMusic?.volume = 0.2
    
    tapMusic = try? AVAudioPlayer(contentsOf: clickUrl)
    tapMusic?.volume = 1 // 播放的音量

    correctMusic = try? AVAudioPlayer(contentsOf: correctUrl)
    correctMusic?.volume = 1

    errorMusic = try? AVAudioPlayer(contentsOf: errorUrl)
    errorMusic?.volume = 2

    victoryMusic = try? AVAudioPlayer(contentsOf: victoryUrl)
    victoryMusic?.volume = 1
    
}
