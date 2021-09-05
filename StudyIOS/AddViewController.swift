import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //새 목록 추가하기
    @IBAction func btnAddItem(_ sender: UIButton) {
        //텍스트 필드의 내용, 즉 새 메모를 items 배열에 추가한다.
        items.append(tfAddItem.text!)
        itemsImageFile.append("WallaceAndGromit_putArmsAround.jpg")
        
        //items에 새 메모를 추가했기 때문에 텍스트 필드는 공백으로 만든다.
        tfAddItem.text = ""
        
        //root 뷰 컨트롤러, 븍 테이블 뷰로 돌아간다.
        _ = navigationController?.popViewController(animated: true)
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
