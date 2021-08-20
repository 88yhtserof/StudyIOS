import UIKit

var images = ["WallaceAndGromit_putArmsAround.jpg",
              "WallaceAndGromit_playingMusic.jpg",
              "WallaceAndGromit_face.png"]


class PageControlMissionViewController: UIViewController {
    @IBOutlet var lblPageIndex: UILabel! //text 속성 사용
    @IBOutlet var imgView: UIImageView! //image 속성 사용
    @IBOutlet var pageControl: UIPageControl! //current, 전체 페이지 수 설정, 색 설정 속성 사용
    
    //뷰 로드 시 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //시작 화면 설정
        imgView.image = UIImage(named: images[0])
        lblPageIndex.text = "1"
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.green
    }
    
    //Evemt - value Change : 페이지가 변하면 호출된다.
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
        lblPageIndex.text = String(pageControl.currentPage + 1)
    }
}
