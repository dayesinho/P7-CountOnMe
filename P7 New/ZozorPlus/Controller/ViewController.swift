import UIKit

class ViewController: UIViewController {
    
    /**
    Variables:
    */
    let calculate = Calculate()
    
    /**
    ViewDidLoad:
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculate.displayAlertsDelegate = self
    }
    
    /**
    IBOutlet:
    */
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    
    /**
    IBActions
    */
    
    @IBAction private func tappedNumberButton(_ sender: UIButton) {
        for (index, numberButton) in numberButtons.enumerated() where sender == numberButton {
            textView.text = calculate.addNewNumber(index)
        }
    }
    
    @IBAction private func actionButtons(_ sender: UIButton) {
        
         if let titleButton = sender.currentTitle {
            
            switch titleButton {
            case "+": textView.text = calculate.plus()
    
            case "-": textView.text = calculate.minus()
        
            case "x": textView.text = calculate.multiply()
            
            case "÷": textView.text = calculate.divide()
            
            case "=": textView.text = calculate.calculTotal()
            
            case "C": textView.text = calculate.erase()
        default:
            break
            }
        }
    }
}

    /**
    Extension to create the alert messages on the UI
    */

extension ViewController: DisplayAlertsDelegate {
    internal func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true)
    }
}
