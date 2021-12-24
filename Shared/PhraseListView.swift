//
//  PhraseListView.swift
//  Multiplatform
//
//  Created by Changyong Fan on 2021/12/16.
//

import SwiftUI
import CoreData

struct PhraseListView: View {
    @StateObject private var dataSource = DataSource()
    
    var body: some View {
        NavigationView {
            List(dataSource.phrases) { phrase in
                NavigationLink(destination: PhraseDetailView(phrase: phrase)) {
                    PhraseCellView(phrase: phrase)
                }
            }
            .navigationTitle("Today Phrases")
        }
        .onAppear {
            print("on appear")
            dataSource.fetchPhrases()
        }
    }
}

struct PhraseListView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseListView()
    }
}
