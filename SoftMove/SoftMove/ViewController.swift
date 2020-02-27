//
//  ViewController.swift
//  SoftMove
//
//  Created by 601 on 2020/02/25.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 물체가 도달할 목표 지점
    var targetX:CGFloat=0;
    var targetY:CGFloat=0;
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func btnClick(_ sender: Any) {
        move()
    }
    
    @IBAction func btnClick2(_ sender: Any) {
    }
    
    // 물체를 감속도로 이동시키는 메소드
    @objc func move(){
        // 한꺼번에 400에 도달하지 말고, 조금씩 도달해보자!(=감속도 공식)
        imgView.frame.origin.x = imgView.frame.origin.x + 0.05*(targetX - imgView.frame.origin.x)
        
        imgView.frame.origin.y = imgView.frame.origin.y + 0.05*(targetY - imgView.frame.origin.y)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 일정 시간 간격으로 호출
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(move), userInfo: nil, repeats: true)
        // view에 터치이벤트 구현하기
        let gesture = UITapGestureRecognizer(target: self, action: #selector(getPoint))
        
        self.view.addGestureRecognizer(gesture)
    }
    // targetX, targetY의 값을 유저가 화면을 터치할 때 대체하자!!
    @objc func getPoint(sender:UITapGestureRecognizer){
        let point = sender.location(in: self.view)
        targetX = point.x
        targetY = point.y
        
    }
}

