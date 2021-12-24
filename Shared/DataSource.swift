//
//  DataSource.swift
//  Multiplatform
//
//  Created by Changyong Fan on 2021/12/16.
//

import Foundation
import Alamofire

class DataSource: ObservableObject {
    @Published var phrases: [Phrase] = []
    
    func fetchPhrases() {
        let request = Alamofire.request("https://raw.githubusercontent.com/fanchangyong/BBC-Learning-English-Crawler/master/phrases.json")
        
        request.validate().responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    // got data
                    let decoder = JSONDecoder()
                    do {
                        self.phrases = try decoder.decode([Phrase].self, from: data)
                    } catch {
                        print("JSON parse error: \(error)")
                    }
                }
            case let .failure(error):
                print("got error: \(error)")
            }
        })
    }
}
