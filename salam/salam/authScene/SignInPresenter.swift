//
//  SignInPresenter.swift
//  salam
//
//  Created by Илья Родионов on 25.12.2022.
//


import Foundation
import UIKit

protocol ISignInPresenter{
    func checkSignIn(login : String, password: String) -> Bool
    func getUserByLoginAndPassword(login : String, password: String) -> Person
}

final class SignInPresenter : ISignInPresenter{
    
    var data : Data = Data()
    
    weak var view : ISignInViewController?
    
    func checkSignIn(login : String, password: String) -> Bool{
        !data.users.filter{$0.login == login && $0.password == password}.isEmpty
    }
    
    func getUserByLoginAndPassword(login : String, password: String) -> Person{
        data.users.filter{$0.login == login && $0.password == password}[0]
    }
        
}
