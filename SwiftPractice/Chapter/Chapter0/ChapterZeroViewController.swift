import UIKit

final class ChapterZeroViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle("ボタンチェンジ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
    }
    @IBOutlet weak var label: UILabel!
    @IBAction func tappedButton(_ sender: Any) {
        label.text = "Goodbye World!"
    }
    @IBOutlet weak var button: UIButton!
}
