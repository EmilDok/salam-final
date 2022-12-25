//
//  SecondPresenter.swift
//  salam
//
//  Created by Илья Родионов on 24.12.2022.
//



import Foundation
import UIKit

protocol IFirstPresenter{
    func getPerson() -> [Person]
    func getPost() -> [Post]
    func getPersonByPost(post: Post) -> Person
    func getCountOfPostLikes(post: Post) -> Int
    func checkPostIsSaved(post: Post) -> Bool
}


final class FirstPresenter : IFirstPresenter{
    
    var data : Data = Data()
    
    let curUser : Person
    
    init(curUser: Person) {
        self.curUser = curUser
    }
    
    weak var view : IFirstViewController?
    
    func getPerson() -> [Person]{
        data.users.filter{$0 != curUser}
    }
    
    func checkIsSubscriber(user: Person, subscriber: Person) -> Bool{
        !data.subs.filter{$0.subscribedId == user.userId && $0.subscriberId == subscriber.userId}.isEmpty
    }
    
    func getPersonById(userId: Int) -> Person{
        data.users.filter{$0.userId == userId}[0]
    }
    
    func getPost() -> [Post]{
        return data.posts.filter{checkIsSubscriber(user: curUser, subscriber: getPersonById(userId: $0.ownerId))}
    }
    
    func getPersonByPost(post: Post) -> Person{
        return data.users.filter{$0.userId == post.ownerId}[0]
    }
    
    func getCountOfPostLikes(post: Post) -> Int{
        return data.likes.filter{$0.postId == post.postId}.count
    }
    
    func checkPostIsSaved(post: Post) -> Bool{
        return data.likes.filter{$0.userId == post.ownerId && $0.postId == post.postId}.isEmpty
    }
        
}
