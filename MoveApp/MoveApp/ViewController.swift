//
//  ViewController.swift
//  MoveApp
//
//  Created by 601 on 2020/02/24.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 방향 결정 변수
    // 이 변수를 대상으로 삼항연산자가 작동함!!
    var lflag:Bool=true;
    
    var flag:Bool=false;
    var stepX = 10;
    
    var xPos:Int = 100
    var yPos:Int = 170
    
    public func function(xPos:Int, yPos:Int){
        imgView.frame.origin=CGPoint(x: xPos, y: yPos)
    }
    
    @IBAction func goReset(_ sender: Any) {
        // 일정한 시간을 두고 함수 자동호출
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
    // 왔다리 갔다리 함수
    @objc public func move(){
        // stepX는 200에 도달하면 음수, stepX는 100에 도달하면 양수로
        stepX = (lflag) ? stepX : -stepX
        // x값 변경
        xPos = xPos + stepX;
        // 우주선 좌표 이동
        function(xPos: xPos, yPos: yPos)
        // 결론 200 or 100에 도달시 부호가 바뀜
        lflag = (xPos > 200 || xPos < 100) ? false : true;
    }
    
    @IBAction func goUp(_ sender: Any) {
        yPos = yPos - 5;
        function(xPos: xPos, yPos: yPos)
    }
    @IBAction func goDown(_ sender: Any) {
        yPos = yPos + 5;
        function(xPos: xPos, yPos: yPos)
    }
    @IBAction func goLeft(_ sender: Any) {
        flag = (xPos==105) ? true : false;
        xPos = (flag) ? 325 : xPos-10;
        function(xPos: xPos, yPos: yPos)
    }
    @IBAction func goRight(_ sender: Any) {
        // 좌표 이동 시키기
        flag = (xPos==525) ? true : false;
        xPos = (flag) ? 325 : xPos+10;
        function(xPos: xPos, yPos: yPos)
    }
    @IBAction func goUpRight(_ sender: Any) {
        xPos = xPos + 5;
        yPos = yPos - 5;
        function(xPos: xPos, yPos: yPos)
    }
    @IBAction func goUpLeft(_ sender: Any) {
        xPos = xPos - 5;
        yPos = yPos - 5;
        function(xPos: xPos, yPos: yPos)
    }
    @IBAction func goDownLeft(_ sender: Any) {
        xPos = xPos - 5;
        yPos = yPos + 5;
        function(xPos: xPos, yPos: yPos)
    }
    @IBAction func goDownRight(_ sender: Any) {
        xPos = xPos + 5;
        yPos = yPos + 5;
        function(xPos: xPos, yPos: yPos)
    }
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

