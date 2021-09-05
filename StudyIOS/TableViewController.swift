//
//  TableViewController.swift
//  StudyIOS
//
//  Created by 임윤휘 on 2021/09/04.
//

import UIKit

var items: Array<String> = ["책 구매", "철수와의 약속", "스터디 준비하기"]
var itemsImageFile: Array<String> = ["WallaceAndGromit_putArmsAround.jpg",
                                     "WallaceAndGromit_playingMusic.jpg",
                                     "WallaceAndGromit_face.png"]



class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    /*
     뷰가 보일 때 호출되는 함수들
     뷰 생성 시 호출되는 함수
     (1)viewDidLoad -> (2)viewWillAppear -> (2)viewDidAppear
     뷰 전환 시 호출되는 함수
     (2)viewWillAppear -> (3)viewDidAppear
     
     (1)viewDidLoad : 뷰가 로드되었을 때 호출되는 함수로, 뷰가 생성될 때 한 번만 호출된다.
     (2)viewWillAppear : 뷰가 노출될 준비가 끝났을 때 호출되는 함수로, 뷰가 노출될 때마다 호출된다.
     (3)viewDidAppear :  뷰가 완전히 보인 후 호출되는 함수.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    //뷰 전환될 때 호출되는 함수
    //리스트가 추가되어 'Main View'로 돌아올 때 호출되며 추가된 내용을 리스트에 보여준다.
    override func viewWillAppear(_ animated: Bool) {
        //뷰가 노출될 때마다 리스트의 데이터를 다시 불러옴
        //테이블 뷰의 행과 섹션을 다시 불러온다.
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //보통 테이블 안에 섹션이 한 개 이므로 numberOfSections의 리턴 값을 1로 한다.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //Row 행, 섹션 당 행의 개수는 items의 개수이므로 numberOfRowsInSection 매개변수를 갖는 tableView 함수의 반환값을 items.count로 한다.
        return items.count
    }

    //셀에 데이터를 적용하는 함수
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        //셀의 텍스트 레이블에 원하는 데이터 대입
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    //셀의 내용을 삭제하는 함수
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    //밀어서 나오는 삭제 버튼 title 수정
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // Override to support rearranging the table view.
    //목록의 순서 재배치
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        //이동할 아이템(from)의 위치를 변수에 저장
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        
        //이동할 아이템(from)을 삭제한다.. 이때 삭제한 아이템 뒤의 아이템들의 인덱스가 재정렬된다.
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        
        //삭제할 아이템(from)을 이동할 위치(to)로 삽입한다. 또한 삽입한 아이템 뒤의 아이템들의 인덱스가 재정렬된다.
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수이며 데이터 전달을 위해 사용된다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            //DetailViewController에 있는 receiveItem 함수 호출
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }

}
