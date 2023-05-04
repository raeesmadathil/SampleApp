//
//  SAArticle.swift
//  Sample App
//
//  Created by Raees DOD on 04/05/2023.
//  Copyright © 2023 Sample. All rights reserved.
//

import Foundation

/// it is to handle feed
struct SAFeed:Decodable{
    
    /// array of articles
    let articles:[SAArticle]?
    
    enum CodingKeys:String, CodingKey{
        case articles = "results"
    }
}

/// it is to handle articles
struct SAArticle:Decodable{
    
    let title:String?
    let abstract:String?
    let section:String?
    let publishedDate:String?
    
    enum CodingKeys:String, CodingKey{
        case title,abstract,section
        case publishedDate = "published_date"
    }
}
