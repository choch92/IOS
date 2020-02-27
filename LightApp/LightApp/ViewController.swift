
import UIKit

class ViewController: UIViewController {

    // 현재 전등의 상태를 나타내는 논리값
    // 변수로 선언한 이유 : 전등값은 고정되어 있으면 안되기 때문
    var flag:Bool = false;
    var opacity:CGFloat = 0.7;
    
    @IBOutlet weak var bt: UIButton!
    
    @IBOutlet weak var surface: UIView!
    @IBAction func btnClick(_ sender: Any) {
        // 위에 덮어진 뷰의 알파값 조정
        flag = !flag;
        opacity = (flag) ? 0.1 : 0.7
        
        surface.alpha = CGFloat(opacity)
        
        // 버튼의 이미지 변경하기
        var url = (flag) ? "switch_on.png" : "switch_off.png";
        bt.setImage(UIImage(named: url), for: UIControl.State.normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

