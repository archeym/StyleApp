//
//  FloatingButton.swift
//  PrototypeUIApp
//
//  Created by Arkadijs Makarenko on 12/07/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit

class FloatingButton: UIButtonX {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            
            if self.transform == .identity{
                
                self.transform = CGAffineTransform(rotationAngle: 45 * (.pi/180))
                self.backgroundColor = #colorLiteral(red: 0.4196, green: 0.4549, blue: 0.3725, alpha: 1) /* #6b745f */

                
            }else {
                self.transform = .identity
                self.backgroundColor = #colorLiteral(red: 0.6549, green: 0.702, blue: 0.6078, alpha: 1) /* #a7b39b */

            }
        })
        
        return super.beginTracking(touch, with: event)
    }
}
 
