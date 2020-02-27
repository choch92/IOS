import UIKit

class ViewController: UIViewController {

    var url = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "5.png", "6.jpeg", "6.png", "20.jpeg", "21.jpeg", "22.jpeg", "23.jpeg"]
    
    // 이미지 뷰를 담아놓을 배열
    var imgViewArray:Array=Array<UIImageView>()
    var pointer:UIView!
    var targetX:Float=0;
    var targetY:Float=0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createImage()
        createPointer()
        // 게임의 엔진에 해당하는 루프 실행
        // 사실상 모든 애니메이션이 가동되려면 루프가 존재해야 함...
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
    
    // 이미지 썸네일 동적 생성
    func createImage(){
        // 3행 * 4열
        
        // 배열 접근 인덱스
        var index:Int=0;
        
        for a in 1...3{
            for i in 1...4{
                let mv = UIImageView(image: UIImage(named: url[index]))
                
                // 나중에 이미지뷰를 제어하기 위해 배열에 쌓기
                imgViewArray.append(mv)
                mv.frame = CGRect(x: 160*i, y: 90*a, width: 80, height: 80)
                self.view.addSubview(mv)
                
                index = index + 1
                
                let gesture = UITapGestureRecognizer(target: self, action: #selector(getPos))
                mv.addGestureRecognizer(gesture)
                mv.isUserInteractionEnabled = true;
            }
        }
    }
    // 포인터 생성하기
    func createPointer(){
        // 첫번째 이미지뷰의 좌표를 포인터의 초기위치로 할당하자!!
        let posX = imgViewArray[0].frame.origin.x
        let posY = imgViewArray[0].frame.origin.y
        pointer = UIView(frame: CGRect(x: posX, y: posY, width: 80, height: 80))
        pointer.backgroundColor = UIColor.red
        pointer.alpha = 0.5
        
        self.view.addSubview(pointer)
    }
    
    @objc func getPos(sender:UITapGestureRecognizer){
        // 지금 터치한 이미지뷰의 좌표 얻기
        let imgView = sender.view as? UIImageView
        targetX = Float(imgView!.frame.origin.x)
        targetY = Float(imgView!.frame.origin.y)
        // 포인터의 위치 지정
        pointer.frame.origin.x = imgView!.frame.origin.x
        pointer.frame.origin.y = imgView!.frame.origin.y
    }
    @objc func move(sender:UITapGestureRecognizer){
        pointer.frame.origin.x = pointer.frame.origin.x + 0.1*(targetX - pointer.frame.origin.x)
        pointer.frame.origin.y = pointer.frame.origin.y + 0.1*(targetY - pointer.frame.origin.y)
    }
}

