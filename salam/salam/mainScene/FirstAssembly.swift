//
//  firstAssembly.swift
//  salam
//
//  Created by Илья Родионов on 25.12.2022.
//

import Foundation
import UIKit

final class FirstAssembly {
    
    static func assembly(user: Person) -> UIViewController{
        
        let presenter = FirstPresenter(curUser: user)
        let view = FirstViewController(presenter: presenter, user: user)
        presenter.view = view
        
        return view
    }
}
