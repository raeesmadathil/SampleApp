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
    let byline:String?
    let media:[Media]?
    
    enum CodingKeys:String, CodingKey{
        case title,abstract,section,byline,media
        case publishedDate  =   "published_date"
    }
}
extension SAArticle{
    
    struct Media:Decodable{
        let metaData:[MediaMetaData]?
        let type:Types?
        
        
        enum CodingKeys:String, CodingKey{
            case type       =   "type"
            case metaData = "media-metadata"
        }
    }
    
    struct MediaMetaData:Decodable{
        let url:URL?
        let height:CGFloat?
        let width:CGFloat?
        
        enum Format:String,Decodable{
            case standard   =   "standard"
            case medium210  =   "mediumThreeByTwo210"
            case medium440  =   "mediumThreeByTwo440"
        }
    }
    
    enum Types:String,Decodable{
        case image
    }
    
}


