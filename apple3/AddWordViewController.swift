//
//  AddWordViewController.swift
//  apple3
//
//  Created by 又吉　雄斗 on 2019/12/15.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//
//

import UIKit

class AddWordViewController: UIViewController {
    
    

    @IBOutlet weak var MeanTextView: UITextView!
    @IBOutlet weak var wordField: UITextField!
    
    
    
    var textFieldString = ""
    let userDefaults = UserDefaults.standard

    
    
    override func viewDidLoad() {
         self.view.addBackground(name: "IMG_9328.JPG")
        super.viewDidLoad()
        // 枠のカラー
        MeanTextView.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        MeanTextView.layer.borderWidth = 0.5
    }
    
    
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // テキスト入力部以外をタッチするとキーボードを格納
        self.view.endEditing(true)
    }
    
    

    
    
    @IBAction func addWordButton(_ sender: Any) {
        
        var wordArray:[String] = []
        
        
        if wordField.text != "" && MeanTextView.text != "" {
            
            // TextFieldから文字を取得
            wordArray.append(contentsOf:[wordField.text!,MeanTextView.text!])
            words.append(wordArray)
            
            // 配列wordsをuserdefaultで保存する．
            userDefaults.set(words, forKey: "wordsArray")
            
            // TextFieldの中身をクリア
            wordField.text = ""
            
            // Secondpageに移動
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "Secondpage") as! SecondViewController
            self.present(nextView, animated: true, completion: nil)
            
        }else{
            showAlert(title: "単語または意味を入力してください")
        }
    }
    
    
    
    
    @IBAction func backPage(_ sender: Any) {
        // Secondpageに移動
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Secondpage") as! SecondViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
    
    
    
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
