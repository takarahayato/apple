//
//  WordEditViewController.swift
//  apple3
//
//  Created by 又吉　雄斗 on 2020/02/06.
//  Copyright © 2020 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

class WordEditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var meanWordField: UITextView!
    
    // 戻るボタンで単語一覧画面に戻る
    @IBAction func pageBack(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Secondpage") as! SecondViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
    // 修正ボタンを押した時の動作
    @IBAction func wordModify(_ sender: Any) {
        // 単語の修正を反映させる
        words[sell] = [wordField.text!, meanWordField.text!]
        // 単語一覧画面に戻る
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Secondpage") as! SecondViewController
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
