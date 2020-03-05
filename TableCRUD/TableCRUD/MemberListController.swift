//
//  MemberListController.swift
//  TableCRUD
//
//  Created by 601 on 2020/03/05.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class Member {
    var name:String;
    var gender:String;
    var age:Int;
    
    // 구조체와는 달리, 클래스는 개발자가 초기화 메서드를 정의해야 함
    init(name:String, gender:String, age:Int){
        self.name = name;
        self.gender = gender;
        self.age = age;
    }
}

class MemberListController: UITableViewController {

    // 구조체 인스턴스를 담게될 배열
    var memberArray:Array = Array<Member>();
    var selectedIntex:Int = 0;  // 유저가 선택한 인덱스
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // 구조체 인스턴스 1개가 반환됨.. 여기서 이름만 선택하여 출력
        let member = memberArray[indexPath.row];
        cell.textLabel?.text = member.name;
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // 이동하기 전에 뭐 니가 준비할 게 있다면 여기서 해라
    // sender는 이벤트를 일으킨 이벤트 소스 즉, 이벤트를 일으킨 컴포넌트(셀)을 포함
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "detailSeg"){
            let cell = sender as! UITableViewCell;
            // 몇번째 셀인지, 셀의 index조사해서 배열 중 몇번째 구조체를 끄집어 낼지 결정
            // 선택한 셀의 인덱스 구하기!!
            let indexPath = self.tableView.indexPath(for: cell);
            selectedIntex = indexPath!.row;
            print("당신이 선택한 셀의 인덱스는 ", indexPath!.row);
            
            // 배열에서 구조체 하나 꺼내기
            let member = memberArray[indexPath!.row]
            // 꺼낸 구조체를 상세보기 컨트롤러에 전달
            let detailViewController = segue.destination as! DetailViewController;
            detailViewController.member = member;
        }
    }
}
