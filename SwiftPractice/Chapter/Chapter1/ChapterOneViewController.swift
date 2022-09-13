import UIKit

final class ChapterOneViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        textField.placeholder = "テキスト"
        textField.textColor = .red
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("returnが押されました")
        return true
    }
}
