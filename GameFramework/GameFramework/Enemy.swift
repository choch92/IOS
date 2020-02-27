//
//  Enemy.swift
//  GameFramework
//
//  Created by 601 on 2020/02/27.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class Enemy: GameObject {
    override func tick() {
        if(x > 700){
            velX = -2
        }
        else if (x < 0){
            velX = 2
        }
        
        if(y > 300){
            velY = -2
        }
        else if(y < 0){
            velY = 2
        }
        x += velX
        y += velY
    }
    override func render() {
        imgView.frame.origin.x = x
        imgView.frame.origin.y = y
    }
}
