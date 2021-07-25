/*
 1. 레이아웃 작성하기
 2. 아울렛 변수 생성하기
 3. 피커 뷰의 델리게이트 설정하기
 4. 필요한 클래스 상속받기(프로토콜 채택), 변수 및 상수 추가하기
 5. 첫 번째 피커 뷰 선택시 파일 명 출력하기
 6. 두 번째 피커 뷰 선택시 이미지 출력하기
 7. 피커 뷰 동작 코드 작성하기
 8. 피커 뷰 룰렛 행 높이 설정
 */

import UIKit

class PickerViewMissionController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 2 //피커 뷰 component 2개 필요
    let PICKER_VIEW_HEIGHT:CGFloat = 100
    var imageArray: Array<UIImage?> = [UIImage?]()
    var imageFileName = ["putArmsAround.jpg",
                         "playingMusic.jpg",
                         "face.png"]

    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    //뷰 로드시 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIImage 타입의 imageArray에 요소 추가
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: "WallaceAndGromit_\(imageFileName[i])")
            imageArray.append(image)
        }
        
        //초기 화면 설정
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    //returns the number of components(columns) to display
    //화면에 보여줄 component 개수(열)를 반환한다.(피커 뷰의 component 개수(열)를 정해주는 곳)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //returns height of row for each component.
    //component 행의 높이를 정할 수 있다.
    //rowHeightForComponent 인수를 가지는 메서드
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component:Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    //Returns The number of rows for the component.
    //numberOfRowsInComponent인수를 가진 델리게이트 메서드
    //한 component의 행의 개수를 반환한다
    //component는 인데스 0부터 시작한다. 인수인 component를 사용해 component를 구분할 수 있다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    //사용자가 피커 뷰의 행을 선택했을 때 할 일을 델리게이트에게 지시하는 메서든
    //didSelectRow 인수가 있는 메서드
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent component: Int) {
        //왼쪽 컴포넌트를 선택했을 때 파일 명 출력, 오른쪽 컴포넌트 선택했을 때 파일 명 출력
        if component == 0 {
            lblImageFileName.text  = imageFileName[row]
        }
        else{
            imageView.image = imageArray[row]
        }
    }
    
    //titleForRow 인수가 있는 델리게이트 메서드를 쓰면 component에 글자가 뜨게 할 수 있다.
    
    //viewForRow 인수가 있는 델리게이트 메서드는 component에 UIView가 뜨도록 한다. -  이미지를 뜨게 할 수 있다.
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int,forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y : 0, width: 150, height: 100)
        
        return imageView
    }
}
