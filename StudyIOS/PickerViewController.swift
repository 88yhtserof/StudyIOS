import UIKit

class PickerViewController: UIViewController,
                            UIPickerViewDelegate,
                            UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT: CGFloat = 100 //피커뷰의 높이 지정할 상수
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
    //피커 뷰의 컴포넌트 수 설정 (열)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //returns height of row for each component
    //피커 뷰에게 컴포넌트의 높이를 정수 값으로 넘겨주는 메서드
    //피커 뷰의 높이 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    //return the # of row in each component..
    //피커 뷰의 개수 설정(행)
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component:Int) -> Int {
        return imageFileName.count
    }
    
    //titleForRow를 인수로 가진 메서드는 각 row에 대한 타이틀을 정의하는 메서드
    //행 이름
//    func pickerView(_ pickerView: UIPickerView,
//                    titleForRow row: Int, forComponent component: Int) -> String?{
//        return imageFileName[row]
//    }
    
    //viewForRow 인수가 포함되어있는 메서드는 각 row에 view를 정의하는 메서드
    //각 row에 view를 설정하고 UIView타입을 리턴한다.
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int, forComponent component: Int, reusing view:UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row]) //선택된 row에 해당하는 이미지를 배열에서 가져온다
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 100)  //이미지뷰의 프레임 크기 설정
        
        return imageView
    }
    
    //didSelectRow를 인수로 가지는 메서드는 사용자가 피커뷰의 룰렛을 돌려 원하는 열을 선택했을 때 할 일을 델리게이트에게 지시하는 메서드
    //즉 피커 뷰가 선택되었을 떄 실행
    func pickerView(_ pickerView:UIPickerView, didSelectRow row: Int, inComponent component: Int){
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}
