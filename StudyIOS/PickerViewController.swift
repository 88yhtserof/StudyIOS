import UIKit

class PickerViewController: UIViewController,
                            UIPickerViewDelegate,
                            UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    var imageFileName = ["WallaceAndGromit_putArmsAround.jpg",
                        "WallaceAndGromit_playingMusic.jpg",
                        "WallaceAndGromit_playingMusic.png"]
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblImageFileName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
