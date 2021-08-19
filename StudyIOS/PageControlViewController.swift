/*
 페이지 컨트롤Page Controll
 현재 뷰에서 보여주고자 하는 내용이 여러 개일 떼 페이지를 나누어서 보여주는 기능
 */
import UIKit

class PageControlViewController: UIViewController {
    var images = ["WallaceAndGromit_putArmsAround.jpg",
                  "WallaceAndGromit_playingMusic.jpg",
                  "WallaceAndGromit_face.png"]
    
    @IBOutlet var imgView: UIImageView! //이미지 뷰의 이미지 속성에 접근해야 함
    @IBOutlet var pageControl: UIPageControl! //페이지컨트롤의 현재 페이지 속성에 접근해야 함
    
    //뷰 로드 시 자동 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //페이지컨트롤의 전체페이지
        pageControl.numberOfPages = images.count
        //페이지 컨트롤의 현재 페이지
        pageControl.currentPage = 0
        //페이지컨트롤 인디케이터 기본 페이지 색 설정
        pageControl.pageIndicatorTintColor = UIColor.green
        //페이지컨트롤 인디케이터 현재 페이지 색 설정
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        imgView.image = UIImage(named: images[0])
    }
    
    /*
     Event 설정은 액션 함수를 어네 실행할지를 결정하는 중요한 항목이다.
     즉, 해당 객체에서 어떠한 이벤트가 발생했을 때 액션 함수를 실행할지 선택하는 것이다.
     view changed는 페이지 컨트롤의 값이 변할 때 액션함수를 실행
     */
    //페이지가 변경될 때 동작할 함수
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
        //pageControl.currentPage는 페이지 컨트롤의 현재 페이지를 가지고 온다.
    }
}
