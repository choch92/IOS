//
//  ViewController.swift
//  DynamicCreate
//
//  Created by 601 on 2020/02/24.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var yPos = 80;
    var xPos = 10;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 이벤트의 종류가 변경될 수 있기 때문에 왠만하면 이벤트 핸들러 영역에 로직을 짜지 말자
    // 별도의 함수로 빼놓기!!
    @IBAction func btnClick(_ sender: Any) {
        for i in 0...5{
            createImage()
        }
    }

    func createImage(){
        // 평소와는 다르게 UIImageView 객체를 프로그래밍 적으로 생성하여(동적) 기존의 뷰에 부착
        var imgView = UIImageView(image: UIImage(named: "2.jpeg"))
        // 이미지 크기 조절
        imgView.frame = CGRect(x: xPos, y: yPos, width: 80 , height: 80)
        self.view.addSubview(imgView)
        yPos = yPos + 85;
    }
}

