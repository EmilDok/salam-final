//
//  Data.swift
//  salam
//
//  Created by Илья Родионов on 25.12.2022.
//

import Foundation
import UIKit

class Data{
    let users = [
        Person(userId: 1, firstName: "Evgeny", secondName: "Safonov", email: "oooq@gmail.com", login: "jena", password: "jena1", avatarImage: UIImage(named: "person")!),
        Person(userId: 2, firstName: "Sergey", secondName: "Schankin", email: "wef", login: "serj", password: "serj1", avatarImage: UIImage(named: "person")!),
        Person(userId: 3, firstName: "Ivan", secondName: "Eroshin", email: "wef", login: "van", password: "van1", avatarImage: UIImage(named: "person")!)
    ]
    
    let posts = [
        Post(postId: 1, name: "post1", image: UIImage(named: "postImg")!, date: "20.20.20", recipeText: """
        Главные правила1:

        1) «мариновать» воду минимум 3-4 часа;
        2) после 12 часов фрукты/наполнители нужно поменять;
        3) хранить только в холодильнике, чтобы цитрусы не горчили
        4) срок годности общий — 3 дня;
        5) чтобы цитрусы не горчили, их нужно или очистить от цедры, или вынуть через 3-4 часа.
        
        
        """, ownerId: 1),
        Post(postId: 2, name: "post2", image: UIImage(named: "postImg")!, date: "21.20.20", recipeText: """
        Главные правила2:

        1) «мариновать» воду минимум 3-4 часа;
        """, ownerId: 2),
        Post(postId: 3, name: "post3", image: UIImage(named: "person")!, date: "22.20.20", recipeText: """
        Главные правила3:

        1) «мариновать» воду минимум 3-4 часа;
        2) после 12 часов фрукты/наполнители нужно поменять;

        
        
        """, ownerId: 3),
        Post(postId: 4, name: "post4", image: UIImage(named: "postImg")!, date: "23.20.20", recipeText:  """
        Главные правила4:

        1) «мариновать» воду минимум 3-4 часа;
        2) после 12 часов фрукты/наполнители нужно поменять;
        3) хранить только в холодильнике, чтобы цитрусы не горчили
        4) срок годности общий — 3 дня;
        5) чтобы цитрусы не горчили, их нужно или очистить от цедры, или вынуть через 3-4 часа.
        
        
        """, ownerId: 1)
    ]
    
    let likes = [
        LikedPosts(postId: 1, userId: 2),
        LikedPosts(postId: 2, userId: 1),
        LikedPosts(postId: 3, userId: 2),
        LikedPosts(postId: 1, userId: 1)
    ]
    
    let subs = [
        Subs(subscriberId: 1, subscribedId: 2),
        Subs(subscriberId: 3, subscribedId: 2),
        Subs(subscriberId: 1, subscribedId: 3),
        Subs(subscriberId: 3, subscribedId: 1)
    ]
    
}
