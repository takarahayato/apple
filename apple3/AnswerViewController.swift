//
//  AnswerViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var Answer: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    
    var RandomNumber :Int!
    var Judgment : DarwinBoolean!
    var RandomFour = [0,1,2,3]
    var Choices = [Int]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        }
        else{
            Answer.text = "残念正解は\(words[Choices[0]][1])"
        }
        UnHide()
    }
    
    @IBAction func Button2Action(_ sender: Any) {
        if(words[Choices[RandomFour[1]]][0] == words[Choices[0]][0]){
            Answer.text = "正解！"
        }
        else{
            
            Answer.text = "残念正解は\(words[Choices[0]][1])"
        }
        UnHide()
    }
    
    
    @IBAction func Button3Action(_ sender: Any) {
        if(words[Choices[RandomFour[2]]][0] == words[Choices[0]][0]){
            Answer.text = "正解！"
        }
        else{
            Answer.text = "残念正解は\(words[Choices[0]][1])"
        }
        UnHide()
    }
    
    @IBAction func Button4Action(_ sender: Any) {
        if(words[Choices[RandomFour[3]]][0] == words[Choices[0]][0]){
            Answer.text = "正解！"
        }
        else{
            Answer.text = "残念正解は\(words[Choices[0]][1])"
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
                  }
    

    
//
    @IBAction func evaluation(_ sender: Any){
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
