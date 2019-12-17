//
//  SecondViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

var words:[[String]] = []

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "WordItem", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = words[indexPath.row][0]+"                "+words[indexPath.row][1]
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // backボタン押下時の処理
          @IBAction func goback(_ sender: Any) {
       
              // ①storyboardのインスタンス取得
              let storyboard: UIStoryboard = self.storyboard!
       
              // ②遷移先ViewControllerのインスタンス取得
              let nextView = storyboard.instantiateViewController(withIdentifier: "Farstpage") as! ViewController
                  // ③画面遷移
              self.present(nextView, animated: true, completion: nil)
                  }
    // add wordボタン押下時の処理
    @IBAction func addword(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Addwordpage") as! AddWordViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBOutlet weak var memotableview: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
