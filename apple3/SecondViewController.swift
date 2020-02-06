//
//  SecondViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

// 単語とその意味のリストのリスト
// ex. [["hello", "こんにちは"], ["see", "見る"]]
var words:[[String]] = []
// タップしたセルのインデックス番号を保存
var cell:Int = 0

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let userDefaults = UserDefaults.standard
    
    // 単語のセルをタップした時の動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // タップしたセルのインデックス番号を保存
        cell = indexPath.row
        // 単語編集画面に移動
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "WordEdit") as! WordEditViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
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
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    //スワイプしたセルを削除　※arrayNameは変数名に変更してください
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            words.remove(at: indexPath.row)
//            userDefaults.synchronize() これは現在非推奨らしい
            userDefaults.set(words, forKey: "wordsArray")
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
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
