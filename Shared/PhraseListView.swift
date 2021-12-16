//
//  PhraseListView.swift
//  Multiplatform
//
//  Created by Changyong Fan on 2021/12/16.
//

import SwiftUI

struct PhraseListView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        NavigationView {
            List(network.phrases) { phrase in
                NavigationLink(destination: PhraseDetailView(phrase: phrase)) {
                    PhraseCellView(phrase: phrase)
                }
            }
            .navigationTitle("Phrases")
        }
        .onAppear {
            print("on appear")
            network.loadPhrases()
        }
    }
}

struct PhraseListView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseListView()
    }
}
