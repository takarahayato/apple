//
//  SmallmissViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

class SmallmissViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
         self.view.addBackground(name: "IMG_9328.JPG")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goback(_ sender: Any) {
    
           // ①storyboardのインスタンス取得
           let storyboard: UIStoryboard = self.storyboard!
    
           // ②遷移先ViewControllerのインスタンス取得
           let nextView = storyboard.instantiateViewController(withIdentifier: "Farstpage") as! ViewController
               // ③画面遷移
           self.present(nextView, animated: true, completion: nil)
               }
    @IBAction func goEvaluation(_ sender: Any) {
    
           // ①storyboardのインスタンス取得
           let storyboard: UIStoryboard = self.storyboard!
    
           // ②遷移先ViewControllerのインスタンス取得
           let nextView = storyboard.instantiateViewController(withIdentifier: "Evaluationpage") as! EvaluationViewController
               // ③画面遷移
           self.present(nextView, animated: true, completion: nil)
               }

    
    // tableViewに表示するセルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missWords.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "tempoMissItem", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = missWords[indexPath.row][0]+"                "+missWords[indexPath.row][1]

        return cell
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
