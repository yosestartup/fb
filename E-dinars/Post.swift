//
//  Post.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 16.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import RealmSwift

class Author: Object, Decodable {
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
    }
    
    @objc dynamic var identifier: String = ""
    @objc dynamic var name: String = ""
}

class Post: Object, Decodable {
    @objc dynamic var descriptionString: String = ""
    @objc dynamic var from: Author?
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var message: String = ""
    @objc dynamic var id: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
    
    public static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.descriptionString == rhs.descriptionString
            && lhs.from?.name == rhs.from?.name
            && lhs.from?.identifier == rhs.from?.identifier
            && lhs.imageUrl == rhs.imageUrl
            && lhs.message == rhs.message
            && lhs.id == rhs.id
            && lhs.from?.name == rhs.from?.name
            && lhs.descriptionString == rhs.descriptionString
    }
    
    class func isPostArraysEqual(first: [Post], second: [Post])  -> Bool{
     
        if first.count != second.count {
            return false
        }
        
        for (elementIndex, post) in first.enumerated() {
            if (second[elementIndex] == post) != true{
                return false
            }
        }
        return true
    }
    
    /// CodingKeys
    enum CodingKeys: String, CodingKey {
        case description
        case from
        case imageUrl = "full_picture"
        case message
        case id
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
        let dataContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        descriptionString = (try? dataContainer.decode(String.self, forKey: .description)) ?? ""
        from = (try? dataContainer.decode(Author.self, forKey: .from)) ?? nil
        imageUrl = (try? dataContainer.decode(String.self, forKey: .imageUrl)) ?? ""
        message = (try? dataContainer.decode(String.self, forKey: .message)) ?? ""
        id = (try? dataContainer.decode(String.self, forKey: .id)) ?? ""
    }
}
