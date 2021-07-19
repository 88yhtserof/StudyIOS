import UIKit

class PickerViewController: UIViewController,
                            UIPickerViewDelegate,
                            UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    var imageArray = [UIImage?]() //var로 선언했기 때문에 수정 가능한 배열
    var imageFileName = ["putArmsAround.jpg",
                        "playingMusic.jpg",
                        "face.png"]
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblImageFileName: UILabel!
    
    //뷰 로드 시 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //image들이 들어있는 배열 생성
        //MAX_ARRAY_NUM 개수만큼 imageFileName 배열에서 이미지를 이름을 사용해 UIImage 타입의 이미지를 생성하여 image 배열에 할당한다.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: "WallaceAndGromit_"+imageFileName[i])
            imageArray.append(image)
        }
        
        //초기 화면 설정
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    //델리게이트 메서드 delegate
    //row 가로 행 column 세로 열
    //returns the number of 'columns' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //return the # of row in each component..
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component:Int) -> Int {
        return imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int, forComponent component: Int) -> String?{
        return imageFileName[row]
    }
    
    //사용자가 피커뷰의 룰렛을 돌려 원하는 열을 선택했을 때 할 일을 델리게이트에게 지시하는 메서드
    func pickerView(_ pickerView:UIPickerView, didSelectRow row: Int, inComponent component: Int){
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}
