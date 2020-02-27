import UIKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController {

    var objectManager:ObjectManager!
    
    var hero:Hero!

    // touch up inside
    @IBAction func stopRight(_ sender: Any) {
        hero.velX = 0
    }
    // touch down
    @IBAction func goRight(_ sender: Any) {
        hero.velX = 2
    }
    // touch up inside
    @IBAction func stopLeft(_ sender: Any) {
        hero.velX = 0
    }
    // touch down
    @IBAction func goLeft(_ sender: Any) {
        hero.velX = -2
    }
    // touch up inside
    @IBAction func stopUp(_ sender: Any) {
        hero.velY = 0
    }
    // touch down
    @IBAction func goUp(_ sender: Any) {
        hero.velY = -2
    }
    // touch up inside
    @IBAction func stopDown(_ sender: Any) {
        hero.velY = 0
    }
    //touch down
    @IBAction func goDown(_ sender: Any) {
        hero.velY = 2
    }
    // 총알
    @IBAction func fire(_ sender: Any) {
        // 총알 클래스로부터 인스턴스 생성하고, 매니저에게 등록을 의뢰
        let bullet = Bullet(objectId:ObjectId.Bullet,objectManager:objectManager, parent: self.view, url: "ball.png", x: hero.x+hero.width, y: hero.y+hero.height/2, width: 30, height: 30, velX: 5, velY: 0)
        objectManager.addObject(obj: bullet)
        soundEffect()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
        
        //명단을 매니저에 넘기자!!
        objectManager = ObjectManager()
        
        createHero()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
    }
    // 주인공 생성
    func createHero(){
        hero = Hero(objectId:ObjectId.Hero,objectManager:objectManager, parent: self.view, url: "plane.png", x: 50, y: 150, width: 80, height: 60, velX: 0, velY: 0)
        // 생성된 주인공을 오브젝트 매니저에게 등록을 의뢰하자!!
        objectManager.addObject(obj: hero)
    }
    
    // 적군 생성
    @objc func createEnemy(){
        let name = ["e1.png", "e2.png", "e3.png", "e4.PNG", "e5.png"]
        for i in 0..<Int.random(in: 1...3){
            let pos = Int.random(in: 0...9)
            
            let en = Enemy(objectId:ObjectId.Enemy,objectManager: objectManager, parent: self.view, url: name[i], x: 750 + 10*CGFloat(pos) , y:50 + CGFloat(pos)*20, width: 50, height: 50, velX: -0.5, velY: 0)
            
            //적군 등록!!
            objectManager.addObject(obj: en)
        }
    }
    
    func soundEffect(){
    }
    
    // 게임에 등장하는 대부분의 오브젝트는 애니메이션이 적용되어야 하므로, 눈에 보이지 않더라도 무한루프가 실행되고 있어야 함
    // 이 무한루프의 속도는 게임 유저가 설정에서 변경할 수도 있다...(FPS)
    @objc func gameLoop(){
        // print("루프 실행중");
        // 게임루프에서는 게임에 등장할 명단이 들어있는 배열을 대상으로 tick(), render()를 무조건 호출
        // 배열에 들어있는 객체가 없을경우 nil(null)로 인한 문제도 발생하지 않는다.
        for obj in objectManager.objectArray{
            obj.tick()
            obj.render()
        }
    }
}

