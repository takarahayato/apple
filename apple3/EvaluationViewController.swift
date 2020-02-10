//
//  EvaluationViewController.swift
//  apple3
//
//  Created by タカラ　ジョシュア　隼 on 2019/12/10.
//  Copyright © 2019 タカラ　ジョシュア　隼. All rights reserved.
//

import UIKit

class EvaluationViewController: UIViewController {
    
    @IBOutlet weak var anser_par: UILabel!
    @IBOutlet weak var hop: UILabel!
    
    override func viewDidLoad() {

        self.view.addBackground(name: "IMG_9328.JPG")

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
        count = 1
        Correct_answer_count = 0
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "Answerpage") as! AnswerViewController
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
        
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

}
