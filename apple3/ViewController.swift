//
//  ViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    

    let userDefaults = UserDefaults.standard
    
    
    var audio2Player: AVAudioPlayer!
    
    
    
    
    override func viewDidLoad() {
        
        
        playSound(name: "ViewController")
        
        super.viewDidLoad()
//        // 配列wordsをuserdefaultで保存する．
//        userDefaults.set(words, forKey: "wordsArray")
        userDefaults.register(defaults: ["wordsArray": []])
        userDefaults.register(defaults: ["miss": []])
        words = userDefaults.array(forKey: "wordsArray") as! [[String]]
        allMissWords = userDefaults.array(forKey: "miss") as! [[String]]
                // Do any additional setup after loading the view.
        // 表示したい画像の名前(拡張子含む)を引数とする。
        self.view.addBackground(name: "test2.JPG")

    }
 
    // 問題ボタン押下時の処理
       @IBAction func goanswer(_ sender: Any) {
        
        audio2Player.stop()
        
        if words.count >= 4 {
            // ①storyboardのインスタンス取得
                   let storyboard: UIStoryboard = self.storyboard!
            
                   // ②遷移先ViewControllerのインスタンス取得
                   let nextView = storyboard.instantiateViewController(withIdentifier: "Answerpage") as! AnswerViewController
                       // ③画面遷移
                   self.present(nextView, animated: true, completion: nil)
        } else {
            showAlert(title: "単語を4つ以上登録してください")
        }

    }
    
           
    
    
    
    // 登録ボタン押下時の処理
       @IBAction func goadd(_ sender: Any) {
        
        audio2Player.stop()
    
           // ①storyboardのインスタンス取得
           let storyboard: UIStoryboard = self.storyboard!
    
           // ②遷移先ViewControllerのインスタンス取得
           let nextView = storyboard.instantiateViewController(withIdentifier: "Secondpage") as! SecondViewController
        
        
               // ③画面遷移
           self.present(nextView, animated: true, completion: nil)
        
        
               }

    //誤答一覧ボタン押した時の処理
    @IBAction func gomissword(_ sender: Any){
        
        
        audio2Player.stop()
        
        let storyboard: UIStoryboard =  self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Misswordpage") as! MisswordViewController
            // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
            }
    //アラートを表示するための関数
    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion:nil)
    }

    
    
    
    func playSound(name: String) {
              guard let path = Bundle.main.path(forResource:name, ofType: "mp3") else {
              print("音源ファイルが見つかりません")
                  return
              }

              do {
           //AVAudioPlayerのインスタンス化
                  audio2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

            //AVAudioPlayerのデリゲートをセット
                  audio2Player.delegate = self

                  // 音声の再生
                  audio2Player.play()
               
               //音楽のループ
               audio2Player.numberOfLoops = -1
              }
              catch {
              }
    


}


}
