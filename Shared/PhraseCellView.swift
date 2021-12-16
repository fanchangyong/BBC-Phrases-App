//
//  PhraseCellView.swift
//  Multiplatform
//
//  Created by Changyong Fan on 2021/12/16.
//

import SwiftUI

struct PhraseCellView: View {
    var phrase: Phrase
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: phrase.imageURL)
            ) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 60)
            
            VStack(alignment: .leading) {
                Text(phrase.title)
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 12)
                Text(phrase.date)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
    }
}

/*
struct PhraseRowView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseCellView(phrase: phrases[0])
    }
}
*/
