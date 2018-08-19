import UIKit

class ViewController: UIViewController {
    
    // Var:
    let calculate = Calculate()
    
    // ViewDidLoad:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculate.displayAlertsDelegate = self
    }
    
    // IBOutlet:
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    
    // MARK: - Action
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (index, numberButton) in numberButtons.enumerated() where sender == numberButton {
            textView.text = calculate.addNewNumber(index)
        }
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        
         if let titleButton = sender.currentTitle {
            
            switch titleButton {
            case "+": self.textView.text = self.calculate.plus()
    
            case "-": self.textView.text = self.calculate.minus()
        
            case "x": self.textView.text = self.calculate.multiply()
            
            case "÷": self.textView.text = self.calculate.divide()
            
            case "=": self.textView.text = self.calculate.calculTotal()
            
            case "C": self.textView.text = self.calculate.erase()
        default:
            break
            }
        }
    }
}

extension ViewController: DisplayAlertsDelegate {
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true)
    }
}
