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
        wordField.text = words[cell_num][0]
        meanWordField.text = words[cell_num][1]
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
        if wordField.text != "" && meanWordField.text != "" {
            // 単語の修正を反映させる
            words[cell_num] = [wordField.text!, meanWordField.text!]
            // 単語一覧画面に戻る
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "Secondpage") as! SecondViewController
            self.present(nextView, animated: true, completion: nil)
        } else {
            showAlert(title: "単語または意味を入力してください")
        }
    }
    
    
    
    
    
    // 画面タップ時の動作
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // キーボード以外をタップするとキーボードを格納
        self.view.endEditing(true)
    }
    
    
    
    
    
    // 警告表示
    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion:nil)
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
