//
//  WriteController.swift
//  TabMenuApp
//
//  Created by 601 on 2020/03/04.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class WriteController: UIViewController {

    @IBOutlet weak var t_input: UITextField!
    
    @IBAction func btnClick(_ sender: Any) {
        // 이전 화면이 보유한 data 배열에 입력한 데이터를 동적으로 추가하자!!
        regist()
    }
    func regist(){
        // 지금 현재 뷰 컨트롤러 클래스를 포함하는 전체 네비게이션 컨트롤러를 이용하여,
        // 나 아닌 다른 뷰 컨트롤러에 접근할 수 있다.
        // as! (형변환 하고 싶은 것) => 우리는 as! BoardListController
        let previous = self.navigationController?.viewControllers[0] as! BoardListController
        print(previous.data);
        // 입력한 값
        let str = t_input.text!;
        previous.data.append(str);
        // 화면 갱신!!
        // tableView를 컨포넌트 갱신
        previous.tableView.reloadData();
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
