//
//  calcViewController.swift
//  Project 2
//
//  Created by Hunter Trujillo on 4/29/26.
//

import UIKit

class calcViewController: UIViewController {
    
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topTextView: UITextView!
    @IBOutlet weak var tipAnswerLabel: UILabel!
    @IBOutlet weak var totalAnswerLabel: UILabel!
    @IBOutlet weak var percentSegment: UISegmentedControl!
    @IBOutlet weak var billTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        topLabel.text = "Tip Calculator"
        topTextView.text = "Enter the cost of your meal and the percentage you would like to tip."
        percentSegment.selectedSegmentIndex = -1
        tipAnswerLabel.text = ""
        totalAnswerLabel.text = ""
        
    }
    
        
        
    
    @IBAction func segmentedControlPressed(_ sender: Any)
    {
        let subtotal: Double = Double(billTextField.text!)!
        let tip0: Double = subtotal * 0.15
        let tip1: Double = subtotal * 0.18
        let tip2: Double = subtotal * 0.20
        
        let total0: Double = subtotal + tip0
        let total1: Double = subtotal + tip1
        let total2: Double = subtotal + tip2
        
        switch percentSegment.selectedSegmentIndex
        {
        case 0:
            tipAnswerLabel.text = "\(tip0)"
            totalAnswerLabel.text = "\(total0)"
        case 1:
            tipAnswerLabel.text = "\(tip1)"
            totalAnswerLabel.text = "\(total1)"
        case 2:
            tipAnswerLabel.text = "\(tip2)"
            totalAnswerLabel.text = "\(total2)"
        default: break
        }
        
        
        
    }
    

}
