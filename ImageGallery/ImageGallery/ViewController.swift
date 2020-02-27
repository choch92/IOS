//
//  ViewController.swift
//  ImageGallery
//
//  Created by 601 on 2020/02/24.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cnt:Int = 0;
    
    @IBAction func btnImage(_ sender: Any) {
        cnt = cnt + 1
        imgView.image = UIImage(named: String(format: "%d.jpeg", cnt))
        if(cnt == 6){
            cnt = 0;
        }
    }
    
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

