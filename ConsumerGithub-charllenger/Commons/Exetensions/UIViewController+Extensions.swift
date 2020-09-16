//
//  UIViewController+Extensions.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func instantiate() -> UIViewController {
        let viewController = UIStoryboard(name: String(describing: Self.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Self.self))
        return viewController
    }
}
