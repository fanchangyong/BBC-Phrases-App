//
//  Network.swift
//  Multiplatform
//
//  Created by Changyong Fan on 2021/12/16.
//

import Foundation
import Alamofire
import SwiftSoup

let BASE_URL = "https://www.bbc.co.uk"

class Network: ObservableObject {
    @Published var phrases: [Phrase] = []
    @Published var currentPhrase: PhraseDetail?
    func parsePhrases(html: String) {
        do {
            let doc = try SwiftSoup.parse(html)
            let items = try doc.select(".course-content-item")
            for item in items {
                var id = ""
                let link = try item.select(".text h2 a").first()?.attr("href") ?? ""
                if let range = link.range(of: "ep-") {
                    id = String(link[range.upperBound...])
                }
                let url = BASE_URL + link
                
                let imageURL = try item.select(".img a img").first()?.attr("src") ?? ""
                let title = try item.select(".text h2 a").first()?.text() ?? ""
                let phrase = Phrase(id: id, url: url, title: title, date: "", imageURL: imageURL, richtext: "")
                phrases.append(phrase)
            }
        } catch {
            print("swit soup parse error: \(error)")
        }
    }
    
    func loadPhrases() {
        let request = Alamofire.request("\(BASE_URL)/learningenglish/chinese/features/todays-phrase")
        request.validate().responseString { response in
            switch response.result {
            case let .success(value):
                self.parsePhrases(html: value)
            case let .failure(error):
                print("error: \(error)")
            }
        }
    }
    
    func parsePhraseDetail(html: String) {
        do {
            let doc = try SwiftSoup.parse(html)
            let description = try doc.select(".widget-richtext .text p").first()?.text() ?? ""
            let newReportItems = try doc.select(".NewsReport")
            var sentences: [String] = []
            for item in newReportItems {
                let sentence = try item.html().replacingOccurrences(of: "<br>", with: "\n")
                sentences.append(sentence)
            }
            self.currentPhrase = PhraseDetail(description: description, sentences: sentences)
        } catch {
            print("swift soup parse detail error: \(error)")
        }
    }
    
    func getPhraseDetail(url: String) {
        let request = Alamofire.request(url)
        self.currentPhrase = nil
        request.validate().responseString { response in
            switch response.result {
            case let .success(value):
                self.parsePhraseDetail(html: value)
            case let .failure(error):
                print("network error: \(error)")
            }
        }
    }
    
}
