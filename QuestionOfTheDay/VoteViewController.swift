//
//  VoteViewController.swift
//  
//
//  Created by Kankanala,Nikhil Reddy on 11/7/17.
//

import UIKit

class VoteViewController: UIViewController {
    
    var questionOfTheDay:QuestionOfTheDay!
    let statistics:Statistician = Statistician()

    @IBOutlet weak var QuestionLBL: UILabel!
    @IBOutlet weak var Ans1: UILabel!
    @IBOutlet weak var Ans2: UILabel!
    @IBOutlet weak var Ans3: UILabel!
    @IBAction func ABTN(_ sender: Any) {
        let opinion:Opinion = Opinion(answer: 0)
        statistics.saveOpinion(Opinion: opinion)
    }
    @IBAction func BBTN(_ sender: Any) {
        let opinion:Opinion = Opinion(answer: 1)
        statistics.saveOpinion(Opinion: opinion)
    }
    @IBAction func CBTN(_ sender: Any) {
        let opinion:Opinion = Opinion(answer: 2)
        statistics.saveOpinion(Opinion: opinion)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLBL?.text = statistics.fetchQuestionOfTheDay().question
        Ans1?.text = statistics.fetchQuestionOfTheDay().answer0
        Ans2?.text = statistics.fetchQuestionOfTheDay().answer1
        Ans3?.text = statistics.fetchQuestionOfTheDay().answer2

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        questionOfTheDay = statistics.fetchQuestionOfTheDay()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
