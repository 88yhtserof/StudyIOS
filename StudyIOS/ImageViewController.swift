import UIKit

class ImageViewController: UIViewController {
    //변수는 클래스 선언문 바로 아래에 추가한다.
    var isZoom : Bool = false //확대 여부를 나타내는 변수
    var imgOn : UIImage?  //켜진 전구 이미지가 있는 UIImage 타입의 변수, 옵셔널 변수
    var imgOff : UIImage? //꺼진 전구 이미지가 있는 UIImage 타입의 변수,  옵셔널 변수
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    //내가 만든 뷰를 불러왔을 때 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "imgOn.jpg")
        imgOff = UIImage(named: "imgOff.jpg")
        
        imgView.image = imgOn //이미지뷰 아울렛 변수에 방금 선언한 imgOn 이미지 지정
        //앱을 실행하면 imgOn.jpg 이미지가 화면에 나타난다.
    }
    
    //확대 버튼 클릭 시 동작할 액션 함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0 // 확대 배율값,
        //CGFloat -> xcode에서 Float을 재정의한 것으로 Float과 같다고 생각하면 된다.
        var newWidth:CGFloat, newHeight:CGFloat//크기 변경 시 저장할 변수
        
        if(isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal) //버튼의 텍스트 변경
        }
        else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        //CGSize 메서드를 사용하여 이미지 뷰의 프레인 크기 변경
        isZoom = !isZoom // isZoom 변수의 상태를 !연산자를 사용하여 값 반전시킨다.
    }
    
    //스위치 On/Off하였을 때 동작할 액션 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        //sender - 클릭되는 스위치 뷰 객체
        if sender.isOn{
            imgView.image = imgOn
        }
        else{
            imgView.image = imgOff
        }
    }
}
