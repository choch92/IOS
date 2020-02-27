//
//  ViewController.swift
//  CountApp
//
//  Created by 601 on 2020/02/24.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 변수 선언
    var cnt:Int=0
    
    // 버튼 선언 : 버튼 클릭 후 마우스 오른쪽 클릭을 누른 상태로 이 페이지로 끌고오기
    @IBAction func btnClick(_ sender: Any) {
        // print("나 눌렀니? 간나색끼야")
        cnt = cnt + 1
        la.text=String(cnt)
        if(cnt > 4){
            cnt = 0
            la.text=String(cnt)
        }
    }
    
    @IBOutlet weak var la: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

