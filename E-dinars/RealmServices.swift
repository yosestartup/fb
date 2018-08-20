//
//  RealmServices.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 19.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//
//swiftlint:disable force_try

import UIKit
import Realm
import RealmSwift

protocol RealmServicesDelegate: class {
    func didFinishLoadingFromDatabase(posts: [Post])
}

class RealmServices {
    weak var delegate: RealmServicesDelegate?
    var posts: [Post] = []
    
    func loadData() {
       let realm = try! Realm()
       let allPosts = Array(realm.objects(Post.self))
       self.delegate?.didFinishLoadingFromDatabase(posts: allPosts)
    }
    
    func updateDatabase(type: Any.Type, posts: [Post]) {
        let realm = try! Realm()
        let allOfflinePosts = Array(realm.objects(Post.self))
        for oldPost in allOfflinePosts {
            for newPost in posts {
                if (oldPost.id != newPost.id) {
                    try! realm.write {
                        let postToDelete = realm.object(ofType: Post.self, forPrimaryKey: oldPost.id)
                        realm.delete(postToDelete!)
                    }
                    break
                }
            }
        }
        
        for post in posts {
            try! realm.write {
                realm.add(post, update: true)
            }
        }
 
    }

    func isElementsSame(posts: [Post]) -> Bool {
        let realm = try! Realm()
        let allPosts = Array(realm.objects(Post.self))
        if Post.isPostArraysEqual(first: allPosts, second: posts) {
            print("same")
            return true
        }
        return false
    }
}
