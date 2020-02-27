//
//  ViewController.swift
//  NationInfo
//
//  Created by 601 on 2020/02/26.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

//나라 정보를 담을 구조체 선언
struct Nation{
    var url:String  //이미지명
    var name:String //나라명
    var city:String //수도
    var rank:Int    //소득순위
}


class ViewController: UIViewController {

    //구조체를 담게될 배열 선언
    var nationArray:Array = Array<Nation>()
    
    var index:Int=0
    @IBOutlet weak var gonfalon: UIImageView!
    @IBOutlet weak var tv_country: UITextField!
    @IBOutlet weak var tv_Incomeranking: UITextField!
    @IBOutlet weak var tv_Capital: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var aa =  Nation(url: "1.png", name: "미국", city: "워싱턴.D.C", rank: 7)
        var bb =  Nation(url: "2.jpg", name: "말레이시아", city: "쿠알라룸푸르", rank: 64)
        var cc =  Nation(url: "3.jpg", name: "그리스", city: "아테네", rank: 41)
        var dd =  Nation(url: "4.png", name: "영국", city: "런던", rank: 21)
        var ee =  Nation(url: "5.jpg", name: "독일", city: "베를린", rank: 16)
        
        
        nationArray.append(aa)
        nationArray.append(bb)
        nationArray.append(cc)
        nationArray.append(dd)
        nationArray.append(ee)
        
    }

    
    @IBAction func btnClick(_ sender: Any) {
        
        next()
        
    }
    
    func next(){
        //nationArray[index]
        gonfalon.image = UIImage(named: nationArray[index].url)
        
        tv_country.text = nationArray[index].name
        
        tv_Capital.text = nationArray[index].city
        
        tv_Incomeranking.text = String(nationArray[index].rank)
        
        if index == nationArray.count-1{
        index = 0
        }else{
        index += 1
        }
        
    }
    
    

}

