//
//  SecondAssembly.swift
//  salam
//
//  Created by Илья Родионов on 24.12.2022.
//

import Foundation
import UIKit

final class SecondAssembly {

    
    static func assembly() -> UIViewController{
        
        let presenter = SecondPresenter()
        let view = SecondViewController(presenter: presenter)
        presenter.view = view
        
        return view
    }
}
