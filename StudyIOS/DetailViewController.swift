import UIKit

class DetailViewController: UIViewController {

    //Main View에서 받을 텍스트를 위해 변수 생성
    var receiveItem: String = ""
    
    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
    }
    
    //Main View에서 변수를 받기 위한 함수를 추가한다.
    func receiveItem(_ item: String){
        receiveItem = item
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
