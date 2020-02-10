//
//  MisswordViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

var allMissWords:[[String]] = []

class MisswordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var userDefaults = UserDefaults.standard

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // 戻るボタンを押した時の動作
    @IBAction func goback(_ sender: Any) {
       // スタート画面に移動する
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Farstpage") as! ViewController
        self.present(nextView, animated: true, completion: nil)
          }
    
    
    
    // tableViewに表示するセルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMissWords.count
    }
    
    // セルに値を表示する
    // 本来は誤答した単語のリストを渡すが，今は仮にwordsを渡している．
    // 誤答単語リストができたらwordsをそれに置き換えて欲しい．
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "missItem", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = allMissWords[indexPath.row][0]+"                "+allMissWords[indexPath.row][1]

        return cell
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    //スワイプしたセルを削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            allMissWords.remove(at: indexPath.row)
//            userDefaults.synchronize() これは現在非推奨らしい
            userDefaults.set(allMissWords, forKey: "miss")
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
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
