//
//  ObjectManager.swift
//  GameFramework
//
//  Created by 601 on 2020/02/27.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit
// 게임에 등장할 모든 오브젝트는 게임 루프에 의해 tick(), render()가 호출되어야 하고
// nil(null)로 인한 에러를 방지하려면 배열에 담아져야 하는데 생성, 소멸시마다 일일이 배열에 담고
// 제거하는 작업이 번거롭기 때문에 아래의 클래스로 코드를 간결하게 처리해 보자
class ObjectManager: NSObject {
    // 게임루프에 의해 호출될 대상들을 담게될 배열
    // 즉 이 배열에 담아진 객체들은 모두 게임루프에 의해 tick(), render()가 호출됨
    var objectArray:Array=Array<GameObject>()   // 게임에 등장할 명단

    // 화면에 등장할 객체 추가하기 (배열에 담기)
    // 객체 등록
    func addObject(obj:GameObject){
        objectArray.append(obj)
    }
    // 화면에서 제거될 객체 처리 (배열에서 제거하기)
    func removeObject(obj:GameObject){
        // 넘겨받은 객체가 배열의 어느 인덱스에 있었는지 조사하자!!
        let index = objectArray.firstIndex(of: obj)
        if index != nil{
            objectArray.remove(at: index!)
        }
        //print("objectArrray의 길이는", objectArray.count)
    }
}
