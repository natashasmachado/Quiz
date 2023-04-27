//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Natasha Machado on 2023-04-26.
//

import UIKit

class QuestionViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  @IBOutlet var rangedStackView: UIStackView!
  @IBOutlet var rangedLabel1: UILabel!
  @IBOutlet var rangedLabel2: UILabel!
  
  @IBOutlet var multipleStackView: UIStackView!
  @IBOutlet var multiLabel1: UIStackView!
  @IBOutlet var multiLabel2: UIStackView!
  @IBOutlet var multiLabel3: UIStackView!
  @IBOutlet var multiLabel4: UIStackView!
  
  @IBOutlet var singleStackView: UIStackView!
  @IBOutlet var singleButton1: UIButton!
  @IBOutlet var singleButton2: UIButton!
  @IBOutlet var singleButton3: UIButton!
  @IBOutlet var singleButton4: UIButton!
  
  
  @IBOutlet var questionProgressView: UIProgressView!
  
  
  @IBOutlet var questionLabel: UILabel!
  
  
  var questions: [Question] = [
    Question(
      text: "Which food do you like the most?",
      type: .single,
      answers: [
        Answer(text: "Steak", type: .dog),
        Answer(text: "Fish", type: .cat),
        Answer(text: "Carrots", type: .rabbit),
        Answer(text: "Corn", type: .turtle)
      ]
    ),
    
    Question(
      text: "Which activities do you enjoy?",
      type: .multiple,
      answers: [
        Answer(text: "Swimming", type: .turtle),
        Answer(text: "Sleeping", type: .cat),
        Answer(text: "Cuddling", type: .rabbit),
        Answer(text: "Eating", type: .dog)
      ]
    ),
    
    Question(
      text: "How much do you enjoy car rides?",
      type: .ranged,
      answers: [
        Answer(text: "I dislike them", type: .cat),
        Answer(text: "I get a little nervous", type: .rabbit),
        Answer(text: "I barely notice them", type: .turtle),
        Answer(text: "I love them", type: .dog)
      ]
    )
  ]
  
  
  var questionIndex = 0
  
  func updateUI() {
    singleStackView.isHidden = true
    multipleStackView.isHidden = true
    rangedStackView.isHidden = true
    
    let currentQuestion = questions[questionIndex]
    let currentAnswers = currentQuestion.answers
    let totalProgress = Float(questionIndex) /
    Float(questions.count)
    
    navigationItem.title = "Question #\(questionIndex + 1)"
    questionLabel.text = currentQuestion.text
    questionProgressView.setProgress(totalProgress, animated:
                                      true)
    
    switch currentQuestion.type {
    case .single:
      updateSingleStack(using: currentAnswers)
    case .multiple:
      updateMultipleStack(using: currentAnswers)
    case .ranged:
      updateRangedStack(using: currentAnswers)
    }
    
  }
  
  
  func updateSingleStack(using answers: [Answer]) {
    singleStackView.isHidden = false
    singleButton1.setTitle(answers[0].text, for: .normal)
    singleButton2.setTitle(answers[1].text, for: .normal)
    singleButton3.setTitle(answers[2].text, for: .normal)
    singleButton4.setTitle(answers[3].text, for: .normal)
  }
  
//
  func updateMultipleStack(using answers: [Answer]) {
    multipleStackView.isHidden = false
    multiLabel1.text = answers[0].text
  }
  
  
  func updateRangedStack(using answers: [Answer]) {
    rangedStackView.isHidden = false
    rangedLabel1.text = answers.first?.text
    rangedLabel2.text = answers.last?.text
  }
  
}
