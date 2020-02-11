//
//  SpellingAnswerViewController.swift
//  apple3
//
//  Created by 松田一秀 on 2020/02/10.
//  Copyright © 2020 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

class SpellingAnswerViewController: UIViewController {
    
    @IBOutlet weak var Answercount: UILabel!
    
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var Answertext: UITextField!
    
    @IBOutlet weak var Input: UILabel!
    
    @IBOutlet weak var Decision: UIButton!
    
    @IBOutlet weak var Answerlabel: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    var userDefaults = UserDefaults.standard
    
    
    var Choices = [Int]()
    var Answer : String!
    var ButtonPush : DarwinBoolean!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // テキスト入力部以外をタッチするとキーボードを格納
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        RandomQuestions()
        missWords = []
    }
    func RandomQuestions(){
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
        Answer = Answertext.text!
        
        if(Answer.lowercased()  == words[Choices[0]][0].lowercased()){
            Answerlabel.text = "正解!"
            Correct_answer_count = Correct_answer_count + 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
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
            UnHide()
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
    }
    
    func evaluation(){
            Question_Select = 1
           // ①storyboardのインスタンス取得
           let storyboard: UIStoryboard = self.storyboard!
    
           // ②遷移先ViewControllerのインスタンス取得
           let nextView = storyboard.instantiateViewController(withIdentifier: "Evaluationpage") as! EvaluationViewController
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
