//
//  ViewController.swift
//  PointTracer
//
//  Created by 601 on 2020/02/25.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t_x: UITextField!
    @IBOutlet weak var t_y: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //디폴트뷰에 터치할 때마다 좌표 구해오기
        let gesture = UITapGestureRecognizer(target: self, action: #selector(getPoint))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func getPoint(sender:UITapGestureRecognizer){
        let point = sender.location(in: self.view)
        t_x.text = String(Double(point.x))
        t_y.text = String(Double(point.y))
        
        // 도트 생성하기
        let dot = UIView(frame: CGRect(x: point.x, y: point.y, width: 5, height: 5))
        dot.backgroundColor = UIColor.red
        // view에 부착!!
        self.view.addSubview(dot)
    }
}

