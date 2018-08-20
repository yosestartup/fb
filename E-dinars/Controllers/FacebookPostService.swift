
//
//  LayerService.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 16.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//
import UIKit
import FBSDKCoreKit

protocol FacebookPostServiceDelegate: class {
    func didFinishDownloading(posts: [Post])
}

class FacebookPostService {
    
    weak var delegate: FacebookPostServiceDelegate?
    var posts: [Post] = []
    
    func loadData() {
        
        FBSDKGraphRequest(graphPath: "me/posts", parameters: ["fields": "from, full_picture, message, description"])
            .start(completionHandler: { (connection, result, error) -> Void in
                
                if let error = error {
                    print (error)
                }
                self.posts = []
                if let resultDict = result as? [String: Any],
                    let data1 = resultDict["data"],
                    let data = try? JSONSerialization.data(withJSONObject: data1, options: []) {
                    if let myStruct = try? JSONDecoder().decode([Post].self, from: data ) {
                        
                        for (elementIndex, ele) in myStruct.enumerated() {
                            let post = Post()
                            post.descriptionString = ele.descriptionString
                            post.from = ele.from
                            post.imageUrl = ele.imageUrl
                            post.message = ele.message
                            post.id = ele.id
                            self.posts.append(post)
                            if elementIndex == myStruct.count-1 {
                            self.delegate?.didFinishDownloading(posts: self.posts)
                            }
                        }
                    }
                }
            })
    }
}
