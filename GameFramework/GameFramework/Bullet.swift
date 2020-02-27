//
//  Bullet.swift
//  GameFramework
//
//  Created by 601 on 2020/02/27.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class Bullet: GameObject {
    
    override func tick(){
        x = x + velX
        // 적군과 나(충돌)와 충돌검사
        for obj in objectManager.objectArray{
            if (obj.objectId == ObjectId.Enemy){
                // 총알과 충돌 여부를 검사할 대상이 됨
                if self.imgView.frame.intersects(obj.imgView.frame){
                    // 총알죽고
                    // 배열제거 + 그래픽처리
                    objectManager.removeObject(obj: self)
                    self.imgView.removeFromSuperview()
                    // 적 죽고
                    objectManager.removeObject(obj: obj)
                    obj.imgView.removeFromSuperview()
                }
            }
        }
        // 적군을 만나지 않고, 지정한 화면을 넘어서면 자살하기!!
        // 자살 = 배열에서 삭제 + 그래픽적으로 제거
        if x > 900{
            // 배열에서 제거
            objectManager.removeObject(obj: self)
            // 부모 뷰로부터 이미지뷰 제거
            self.imgView.removeFromSuperview()
        }
    }
    override func render() {
        imgView.frame.origin.x = x
    }
}
