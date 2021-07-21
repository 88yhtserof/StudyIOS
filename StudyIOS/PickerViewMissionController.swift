/*
 1. 레이아웃 작성하기
 2. 아울렛 변수 생성하기
 3. 피커 뷰의 델리게이트 설정하기
 4. 필요한 클래스 상속받기(프로토콜 채택), 변수 및 상수 추가하기
 5. 피커 뷰 동작 코드 작성하기
 6. 첫 번째 피커 뷰 선택시 파일 명 출력하기
 7. 두 번째 피커 뷰 선택시 이미지 출력하기
 */

import UIKit

class PickerViewMissionController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 2 //피커 뷰 컴포넌트 2개 필요
    var imageFileName = ["putArmsAround.jpg",
                         "playingMusic.jpg",
                         "face.png"]

    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
}
