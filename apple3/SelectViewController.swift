//
//  SelectViewController.swift
//  apple3
//
//  Created by 松田一秀 on 2020/02/10.
//  Copyright © 2020 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Answer(_ sender: Any) {
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "Answerpage") as! AnswerViewController
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
    }
    
    
    @IBAction func SpellingAnswer(_ sender: Any) {
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "Answerpage") as! AnswerViewController
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
    }
    
    
    @IBAction func goback(_ sender: Any) {
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "Farstpage") as! ViewController
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
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
