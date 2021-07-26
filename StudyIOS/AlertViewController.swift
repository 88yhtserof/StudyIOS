/*
 얼럿(Alert):
 사용자에게 중요한 알림이나 경고 메세지를 나타내야 할 때 주로 사용한다.
 사용자의 주의를 집중시키는 경고로 마무리할 수도 있고 후속 조치를 취할 수도 있다.
 */
import UIKit

class AlertViewController: UIViewController{
    
    let imgOn: UIImage? = UIImage(named: "imgOn.jpg")
    let imgOff: UIImage? = UIImage(named: "imgOff.jpg")
    let imgRemove: UIImage? = UIImage(named: "imgBlack.jpg")
    
    var isLampOn: Bool = true
    
    /*
     액션 함수: 객체가 선택되었을 때 어떤 동작을 수행해야 한다면 액션함수로 추가한다.
     아울렛 변수: 객체의 값을 이용하거나 속성 들을 제어해야 한다면 아울렛 변수 형태로 추가한다.
     */
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //초기 화면 설정
        imageView.image = imgOn
    }

    //켜기 버튼 클릭 시 동작하는 함수
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn){
            //UIAlertController 객체 생성
            let lampOnAlert = UIAlertController(title: "경고",
                                                message: "현재 On 상태입니다.",
                                                preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            //AlerAction을 생성한 뒤 UIAlertController 객체(얼럿)에 액션 설정을 추가한다.
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }else{
            imageView.image = imgOn
            isLampOn = true
        }
    }
    
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프르 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "네",
                                          style: UIAlertAction.Style.default,
                                          handler: {//익명함수
                                            ACTION in //매개변수 in
                                            self.imageView.image  = self.imgOff //실행구문
                                            self.isLampOn = false
                                          })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        //handler 매개변수를 삭제하고 뒤쪽에 {}사용해 익명함수를 구현할 수도 있다.
        let offAction = UIAlertAction(title: "아니오, 끕니다.", style: UIAlertAction.Style.default){
            ACTION in
            self.imageView.image = self.imgOff
            self.isLampOn = false
        }
        
        let onAction = UIAlertAction(title: "아니오, 켭니다.", style: UIAlertAction.Style.default){
            ACTION in
            self.imageView.image = self.imgOn
            self.isLampOn = true
        }
        
        let removeAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default){
            ACTION in
            self.imageView.image = self.imgRemove
            self.isLampOn = false
        }
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}
