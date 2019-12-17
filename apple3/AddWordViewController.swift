//
//  AddWordViewController.swift
//  apple3
//
//  Created by 又吉　雄斗 on 2019/12/15.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

class AddWordViewController: UIViewController {

    @IBOutlet weak var MeanTextView: UITextView!
    
    @IBOutlet weak var wordField: UITextField!
    
    var textFieldString = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 枠のカラー
        MeanTextView.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        MeanTextView.layer.borderWidth = 0.5
        

        // Do any additional setup after loading the view.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // テキスト入力部以外をタッチするとキーボードを格納
        self.view.endEditing(true)
    }
    // 語の意味を入力するフィールド
    @IBAction func wordTextField(_ sender: Any) {
    }
    
    @IBAction func addWordButton(_ sender: Any) {
        
        var wordArray:[String] = []
        wordArray.append(contentsOf:[wordField.text!,MeanTextView.text!])
        
        // TextFieldから文字を取得
        words.append(wordArray)
    
//        words.append(textFieldString)

        // TextFieldの中身をクリア
        wordField.text = ""
        // Secondpageに移動
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Secondpage") as! SecondViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func backPage(_ sender: Any) {
        // Secondpageに移動
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
