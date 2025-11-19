//
//  Post.swift
//  M2Homework7
//
//  Created by Oleg Konstantinov on 18.11.2025.
//

import Foundation

struct Post {
    let username: String
    let avatar: String
    let image: String
    let date: String
    let description: String

    
    static func mockLoadData() -> [Post]{
        [
                Post(username: "User Name", avatar: "avatar", image: "post1", date: "18.11.2025", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
                Post(username: "User Name", avatar: "avatar", image: "post2", date: "19.11.2025", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"),
//                Post(username: "User Name", avatar: "avatar", image: "post1", date: "18.11.2025", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
        ]
    }
}
