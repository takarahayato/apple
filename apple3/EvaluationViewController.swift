//
//  EvaluationViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit
import AVFoundation

class EvaluationViewController: UIViewController,AVAudioPlayerDelegate {
    
    
    var audio4Player: AVAudioPlayer!

    override func viewDidLoad() {
        
        playSound(name: "EvaluationView")
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goback(_ sender: Any) {
        
        
        audio4Player.stop()
        
       
              // ①storyboardのインスタンス取得
              let storyboard: UIStoryboard = self.storyboard!
       
              // ②遷移先ViewControllerのインスタンス取得
              let nextView = storyboard.instantiateViewController(withIdentifier: "Farstpage") as! ViewController
                  // ③画面遷移
              self.present(nextView, animated: true, completion: nil)
                  }
    @IBAction func goanswer(_ sender: Any) {
        
        
        audio4Player.stop()
    
           // ①storyboardのインスタンス取得
           let storyboard: UIStoryboard = self.storyboard!
    
           // ②遷移先ViewControllerのインスタンス取得
           let nextView = storyboard.instantiateViewController(withIdentifier: "Answerpage") as! AnswerViewController
               // ③画面遷移
           self.present(nextView, animated: true, completion: nil)
               }
    @IBAction func gosmallmiss(_ sender: Any) {
        
        audio4Player.stop()
    
           // ①storyboardのインスタンス取得
           let storyboard: UIStoryboard = self.storyboard!
    
           // ②遷移先ViewControllerのインスタンス取得
           let nextView = storyboard.instantiateViewController(withIdentifier: "Smallmisspage") as! SmallmissViewController
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
    
    
    func playSound(name: String) {
                  guard let path = Bundle.main.path(forResource:name, ofType: "mp3") else {
                  print("音源ファイルが見つかりません")
                      return
                  }

                  do {
               //AVAudioPlayerのインスタンス化
                      audio4Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

                //AVAudioPlayerのデリゲートをセット
                      audio4Player.delegate = self

                      // 音声の再生
                      audio4Player.play()
                   
                   //音楽のループ
                   audio4Player.numberOfLoops = -1
                  }
                  catch {
                  }
        


    }


}
