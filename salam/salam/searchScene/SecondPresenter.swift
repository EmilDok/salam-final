//
//  SecondPresenter.swift
//  salam
//
//  Created by Илья Родионов on 24.12.2022.
//



import Foundation
import UIKit

protocol ISecondPresenter{
    func getPerson() -> [Person]
    func getPost() -> [Post]
    func getPersonByPost(post: Post) -> Person
    func getCountOfPostLikes(post: Post) -> Int
    func checkPostIsSaved(post: Post) -> Bool
}


final class SecondPresenter : ISecondPresenter{
    
    var data : Data = Data()
    
    weak var view : ISecondViewController?
    
    func getPerson() -> [Person]{
        return data.users
    }
    
    func getPost() -> [Post]{
        return data.posts
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
