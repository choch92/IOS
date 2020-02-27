//
//  ViewController.swift
//  PalletEffect
//
//  Created by 601 on 2020/02/25.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 이미지 배열 선언
    var imageArray:Array = Array<UIImage>();
    var imageURL=["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "6.png"]
    
    // 배열 선언
    var colorArray = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green,
                      UIColor.blue, UIColor.gray, UIColor.purple]
    
    var bbig:UIImageView!
    @IBOutlet weak var big: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRect()
        
        // 배열에 요소 추가하기
        for name in imageURL{
            imageArray.append(UIImage(named: name)!)
        }
        createImgRect()
    }
    
    // 팔레트 사각형 조각들 생성하기!!
    func createRect(){
        for i in 0...6{
            let myView = UIView(frame: CGRect(x: 257+(i*52), y: 80, width: 50, height: 50))
            myView.backgroundColor = colorArray[i]
            // 뷰에 터치 이벤트 동적 부여
            // 제스쳐 객체 생성
            let gesture = UITapGestureRecognizer(target: self, action: #selector(showBg))
            myView.addGestureRecognizer(gesture)
            self.view.addSubview(myView)
        }
    }
    @objc func showBg(sender:UITapGestureRecognizer){
        big.backgroundColor = sender.view?.backgroundColor
        print("나 눌렀니?")
    }
    
    // 이미지 사각형 조각들 생성
    func createImgRect(){
        for i in 0..<imageArray.count{
            let imgView = UIImageView(image: imageArray[i])
            // 크기 지정
            imgView.frame = CGRect(x: 257+(i*52), y: 140, width: 50, height: 50)
            self.view.addSubview(imgView)
            
            // 썸네일에 동적 이벤트 부여
            let gesture = UITapGestureRecognizer(target: self, action: #selector(showImg))
            imgView.addGestureRecognizer(gesture)
            imgView.isUserInteractionEnabled = true
        }
        bbig = UIImageView(image: imageArray[0])
        bbig.frame = CGRect(x: 200, y: 200, width: 200, height: 170)
    }
    
    @objc func showImg(sender:UITapGestureRecognizer){
        var photo = sender.view as! UIImageView
        bbig.image = photo.image
    }
}

