//
//  PhraseDetailView.swift
//  BBC-Learning-English
//
//  Created by Changyong Fan on 2021/12/16.
//

import SwiftUI

struct PhraseDetailView: View {
    var phrase: Phrase
    
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
            
            VStack(alignment: .leading, spacing: 8) {
                Text(phrase.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(phrase.desc ?? "")
                Text("例句")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                
                ForEach(phrase.sentences ?? [], id: \.self) { sentence in
                    Text(sentence)
                }
                
            }
            .padding()
            Spacer()
            
        }
    }
}
