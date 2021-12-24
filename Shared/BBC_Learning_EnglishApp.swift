//
//  BBC_Learning_EnglishApp.swift
//  Shared
//
//  Created by Changyong Fan on 2021/12/16.
//

import SwiftUI

@main
struct BBC_Learning_EnglishApp: App {
    @StateObject var dataSource = DataSource()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataSource)
        }
    }
}
