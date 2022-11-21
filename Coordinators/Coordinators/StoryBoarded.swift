//
//  StoryBoarded.swift
//  Coordinators
//
//  Created by Matko Mihaljl on 13.10.2022..
//

import Foundation
import UIKit


protocol StoryBoarded{
    static func instantiante() -> Self
    
}

extension StoryBoarded where Self: UIViewController{
    static func instantiante() -> Self{
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
