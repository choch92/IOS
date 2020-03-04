//
//  BoardListController.swift
//  TabMenuApp
//
//  Created by 601 on 2020/03/04.
//  Copyright © 2020 601. All rights reserved.
//

import UIKit

class BoardListController: UITableViewController {

    // 보여질 데이터
    var data = ["사과", "딸기", "아보카도"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // 리스트를 그룹화(=섹션) 시켜 놓을 수 있는 메서드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 각 섹션마다 보여질 레코드 수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 배열의 갯수
        return data.count;
    }

    // 위의 메서드가 반환한 배열 수 만큼 메서드 호출하면서 각 셀에 보여질 데이터를 재정의하면 됨
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        print("cell 반환 메서드 호출!!");
        
        // 셀을 반환하기 전에 개발자는 하고 싶은 작업을 해야 한다!!!
        cell.textLabel?.text = data[indexPath.row];
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
