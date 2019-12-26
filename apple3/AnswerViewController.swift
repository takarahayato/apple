//
//  AnswerViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit
import AVFoundation

class AnswerViewController: UIViewController ,AVAudioPlayerDelegate{
    
    
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var Answer: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    
    var player:AVAudioPlayer!
    var player2:AVAudioPlayer!
    var audioPlayer: AVAudioPlayer!
    var RandomNumber :Int!
    var Judgment : DarwinBoolean!
    var RandomFour = [0,1,2,3]
    var Choices = [Int]()


    
    
   
    
    
    override func viewDidLoad() {
        
        
        playSound(name: "12058")
        
        
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "incorrect1", ofType:"mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        let audioPath2 = Bundle.main.path(forResource: "correct1", ofType:"mp3")!
        let audioUr2 = URL(fileURLWithPath: audioPath2)
        
        
        do {
            try player = AVAudioPlayer(contentsOf:audioUrl)
            
            try player2 = AVAudioPlayer(contentsOf:audioUr2)
            //音楽をバッファに読み込んでおく
            player.prepareToPlay()
        } catch {
            print(error)
        }
        
        RandomQuestions()
        
        

        // Do any additional setup after loading the view.
    }
    
    func RandomQuestions(){
        Hide()
        Choices = [Int]()
        Choices.append(Int(arc4random()) % words.count)
        
        for _ in 0 ... 2{
            Loop()
        }
        RandomFour.shuffle()
        
        Question.text = words[Choices[0]][0]
        Button1.setTitle(words[Choices[RandomFour[0]]][1], for: UIControl.State())
        Button2.setTitle(words[Choices[RandomFour[1]]][1], for: UIControl.State())
        Button3.setTitle(words[Choices[RandomFour[2]]][1], for: UIControl.State())
        Button4.setTitle(words[Choices[RandomFour[3]]][1], for: UIControl.State())
    }
    
    
    func Loop(){
        Judgment = true
        RandomNumber = Int(arc4random()) % words.count
        for i in stride(from: 0, to: Choices.count, by: 1){
            if (RandomNumber == Choices[i]){
                Loop()
                Judgment = false
            }
        }
        if(Judgment == true){
            Choices.append(RandomNumber)
        }
       
    }
    
    func Hide(){
        Answer.isHidden = true
        NextButton.isHidden = true
    }
    func UnHide(){
        Answer.isHidden = false
        NextButton.isHidden = false
    }
    

    
    @IBAction func Button1Action(_ sender: Any) {
        if(words[Choices[RandomFour[0]]][0] == words[Choices[0]][0]){
            Answer.text = "正解！"
            player2.play()
        }
        else{
            Answer.text = "残念正解は\(words[Choices[0]][1])"
            player.play()
        }
        UnHide()
    }
    
    @IBAction func Button2Action(_ sender: Any) {
        if(words[Choices[RandomFour[1]]][0] == words[Choices[0]][0]){
            Answer.text = "正解！"
            player2.play()
        }
        else{
            
            Answer.text = "残念正解は\(words[Choices[0]][1])"
            player.play()
        }
        UnHide()
    }
    
    
    @IBAction func Button3Action(_ sender: Any) {
        if(words[Choices[RandomFour[2]]][0] == words[Choices[0]][0]){
            Answer.text = "正解！"
            player2.play()
        }
        else{
            Answer.text = "残念正解は\(words[Choices[0]][1])"
             player.play()
        }
        UnHide()
    }
    
    @IBAction func Button4Action(_ sender: Any) {
        if(words[Choices[RandomFour[3]]][0] == words[Choices[0]][0]){
            Answer.text = "正解！"
            player2.play()
        }
        else{
            Answer.text = "残念正解は\(words[Choices[0]][1])"
            player.play()
        }
        UnHide()
    }
    
    
    
    @IBAction func NextButtonAction(_ sender: Any) {
        RandomQuestions()
    }
    
    
    
    
    
    // backボタン押下時の処理
    @IBAction func goback(_ sender: Any) {
       
              // ①storyboardのインスタンス取得
              let storyboard: UIStoryboard = self.storyboard!
       
              // ②遷移先ViewControllerのインスタンス取得
              let nextView = storyboard.instantiateViewController(withIdentifier: "Farstpage") as! ViewController
                  // ③画面遷移
              self.present(nextView, animated: true, completion: nil)
        
              audioPlayer.stop()
                  }
    

    
//
    @IBAction func evaluation(_ sender: Any){
               // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "Evaluationpage") as! EvaluationViewController
                   // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
        
               audioPlayer.stop()
                   }
    
     
    
    func playSound(name: String) {
           guard let path = Bundle.main.path(forResource:name, ofType: "mp3") else {
           print("音源ファイルが見つかりません")
               return
           }

           do {
        //AVAudioPlayerのインスタンス化
               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

         //AVAudioPlayerのデリゲートをセット
               audioPlayer.delegate = self

               // 音声の再生
               audioPlayer.play()
            
            //音楽のループ
            audioPlayer.numberOfLoops = -1
           }
           catch {
           }
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
