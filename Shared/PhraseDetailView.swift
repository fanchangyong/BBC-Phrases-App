//
//  PhraseDetailView.swift
//  BBC-Learning-English
//
//  Created by Changyong Fan on 2021/12/16.
//

import SwiftUI
import AVFoundation

struct PhraseDetailView: View {
    var phrase: Phrase
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ScrollView {
            AsyncImage(
                url: URL(string: phrase.imageURL)
            ) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 24) {
                HStack() {
                    Text("\(phrase.title)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Text(phrase.desc ?? "")
                Text("例句")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                
                ForEach(phrase.sentences ?? [], id: \.self) { sentence in
                    VStack(alignment: .leading, spacing: 8) {
                        Button("🗣Speak") {
                            print("clicked")
                            if synthesizer.isSpeaking {
                                synthesizer.stopSpeaking(at: .immediate)
                            }
                            let utterance = AVSpeechUtterance(string: sentence)
                            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                            synthesizer.speak(utterance)
                        }
                        Text(sentence)
                        
                    }
                }
                
            }
            .padding()
            Spacer()
            
        }
    }
}
