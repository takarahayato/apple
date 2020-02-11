//
//  EvaluationViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit
import AVFoundation

var musicJudge2 : DarwinBoolean! = false
var audioPlayerEvaluation: AVAudioPlayer!

class EvaluationViewController: UIViewController,AVAudioPlayerDelegate {
    
    @IBOutlet weak var anser_par: UILabel!
    @IBOutlet weak var hop: UILabel!
    
    
    override func viewDidLoad() {
        if(musicJudge2==false){
            playSound(name: "music_B")
            musicJudge2 = true
        }
        
        Hide()
        super.viewDidLoad()
        
        
        
        
        if(count_max == Correct_answer_count){
            UnHide()
            hop.numberOfLines = 2;
            hop.text = "さすがだぞ！英単語をしっかり\n覚えているんだな！"
        }
        anser_par.text = "\(Correct_answer_count)/\(count_max)"
        // Do any additional setup after loading the view.
    }
    
    
    func Hide(){
        hop.isHidden = true
    }
    func UnHide(){
        hop.isHidden = false
    }
    @IBAction func goback(_ sender: Any) {
        audioPlayerEvaluation.stop()
        musicJudge2 = false
        count = 1
        Correct_answer_count = 0
       
              // ①storyboardのインスタンス取得
              let storyboard: UIStoryboard = self.storyboard!
       
              // ②遷移先ViewControllerのインスタンス取得
              let nextView = storyboard.instantiateViewController(withIdentifier: "Farstpage") as! ViewController
                  // ③画面遷移
              self.present(nextView, animated: true, completion: nil)
                  }
    @IBAction func goanswer(_ sender: Any) {
        audioPlayerEvaluation.stop()
        musicJudge2 = false
        count = 1
        Correct_answer_count = 0
        if(Question_Select == 0){
            // ①storyboardのインスタンス取得
            let storyboard: UIStoryboard = self.storyboard!
            // ②遷移先ViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(withIdentifier: "Answerpage") as! AnswerViewController
            // ③画面遷移
            self.present(nextView, animated: true, completion: nil)
        }
        else if(Question_Select == 1){
            // ①storyboardのインスタンス取得
            let storyboard: UIStoryboard = self.storyboard!
            // ②遷移先ViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(withIdentifier: "SpellingAnswerViewController") as! SpellingAnswerViewController
            // ③画面遷移
            self.present(nextView, animated: true, completion: nil)
        }
        else{
            // ①storyboardのインスタンス取得
            let storyboard: UIStoryboard = self.storyboard!
            // ②遷移先ViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(withIdentifier: "WrongAnswerViewController") as! WrongAnswerViewController
            // ③画面遷移
            self.present(nextView, animated: true, completion: nil)
        }
    }
    @IBAction func gosmallmiss(_ sender: Any) {
    
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
                  audioPlayerEvaluation = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

            //AVAudioPlayerのデリゲートをセット
                  audioPlayerEvaluation.delegate = self

                  // 音声の再生
                  audioPlayerEvaluation.play()
               
               //音楽のループ
               audioPlayerEvaluation.numberOfLoops = -1
              }
              catch {
              }
          }
}
