//
//  ViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
 
    // 解答ボタン押下時の処理
       @IBAction func goanswer(_ sender: Any) {
    
           // ①storyboardのインスタンス取得
           let storyboard: UIStoryboard = self.storyboard!
    
           // ②遷移先ViewControllerのインスタンス取得
           let nextView = storyboard.instantiateViewController(withIdentifier: "Answerpage") as! AnswerViewController
               // ③画面遷移
           self.present(nextView, animated: true, completion: nil)
               }
    
    
    
    
    // 登録ボタン押下時の処理
       @IBAction func goadd(_ sender: Any) {
    
           // ①storyboardのインスタンス取得
           let storyboard: UIStoryboard = self.storyboard!
    
           // ②遷移先ViewControllerのインスタンス取得
           let nextView = storyboard.instantiateViewController(withIdentifier: "Secondpage") as! SecondViewController
               // ③画面遷移
           self.present(nextView, animated: true, completion: nil)
               }

    //誤答一覧ボタン押した時の処理
    @IBAction func gomissword(_ sender: Any){
        let storyboard: UIStoryboard =  self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Misswordpage") as! MisswordViewController
            // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
            }

    


}


