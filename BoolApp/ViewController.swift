//
//  ViewController.swift
//  BoolApp
//
//  Created by 601 on 2020/02/24.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnCahnge(_ sender: Any) {
        flag = !flag
        setValue()
    }
    @IBOutlet weak var la: UILabel!
    // swift는 기본 자료형이 없다.
    // 기본자료형을 구조체로 처리한다.
    var flag:Bool=false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
    }
    
    // 논리값을 화면에 출력한다.
    func setValue(){
        la.text=String(flag)
    }
}

