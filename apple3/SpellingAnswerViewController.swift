//
//  SpellingAnswerViewController.swift
//  apple3
//
//  Created by 松田一秀 on 2020/02/10.
//  Copyright © 2020 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit
import AVFoundation

class SpellingAnswerViewController: UIViewController,AVAudioPlayerDelegate {
    
    @IBOutlet weak var Answercount: UILabel!
    
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var Answertext: UITextField!
    
    @IBOutlet weak var Input: UILabel!
    
    @IBOutlet weak var Decision: UIButton!
    
    @IBOutlet weak var Answerlabel: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    var userDefaults = UserDefaults.standard
    
    var player:AVAudioPlayer!
    var player2:AVAudioPlayer!
    var audioPlayer: AVAudioPlayer!
    var Choices = [Int]()
    var Answer : String!
    var ButtonPush : DarwinBoolean!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // テキスト入力部以外をタッチするとキーボードを格納
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
         self.view.addBackground(name: "IMG_9371.JPG")
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

        // Do any additional setup after loading the view.
        RandomQuestions()
        missWords = []
    }
    func RandomQuestions(){
        ButtonPush = true
        Answertext.text = ""
        Choices = [Int]()
        Choices.append(Int(arc4random()) % words.count)
        Answercount.text = "\(count)/\(count_max)"
        Hide()
        ButtonPush = true
        
        
        
        Question.text = words[Choices[0]][1]
        
    }
    
    
    
    func Hide(){
        Answerlabel.isHidden = true
        NextButton.isHidden = true
    }
    func UnHide(){
        Answerlabel.isHidden = false
        NextButton.isHidden = false
    }
    func CorrectUnHide(){
        Answerlabel.isHidden = false
    }
    
    
    @IBAction func Decision(_ sender: Any) {
        if(ButtonPush == true){
            ButtonPush = false
            Answer = Answertext.text!
            
            if(Answer.lowercased()  == words[Choices[0]][0].lowercased()){
                Answerlabel.text = "正解!"
                player2.play()
                Correct_answer_count = Correct_answer_count + 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    // 1.5秒後に実行したい処理
                    if(count != count_max){
                        count = count + 1
                        if(count == count_max){
                            self.NextButton.setTitle("終了", for: UIControl.State())
                        }
                        self.RandomQuestions()
                    }
                    else{
                        self.evaluation()
                    }
                }
                CorrectUnHide()
            }
            else{
                Answerlabel.text = "残念正解は\(words[Choices[0]][0])"
                missWords.append(words[Choices[0]])
                player.play()
                UnHide()
            }
        }
    }
    
    
    @IBAction func NextButton(_ sender: Any) {
        if(count != count_max){
            count = count + 1
            if(count == count_max){
                NextButton.setTitle("終了", for: UIControl.State())
            }
            RandomQuestions()
        }
        else{
            // 誤答単語一覧での単語の重複を解消する
            let orderedSet2: NSOrderedSet = NSOrderedSet(array: missWords)
            missWords = orderedSet2.array as! [[String]]
            for i in missWords {
                allMissWords.append(i)
            }
            // 全誤答単語一覧での単語の重複を解消する
            let orderedSet: NSOrderedSet = NSOrderedSet(array: allMissWords)
            allMissWords = orderedSet.array as! [[String]]
            userDefaults.set(allMissWords, forKey: "miss")
            evaluation()
        }
    }
    
    @IBAction func goback(_ sender: Any) {
        count = 1
        Correct_answer_count = 0
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "Farstpage") as! ViewController
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
        
        audioPlayer.stop()
    }
    
    func evaluation(){
        Question_Select = 1
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
