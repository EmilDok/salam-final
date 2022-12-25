//
//  SecondAssembly.swift
//  salam
//
//  Created by Илья Родионов on 24.12.2022.
//

import Foundation
import UIKit

final class SignInAssembly {

    
    static func assembly() -> UIViewController{
        
        let presenter = SignInPresenter()
        let view = SignInViewController(presenter: presenter)
        presenter.view = view
        
        return view
    }
}
