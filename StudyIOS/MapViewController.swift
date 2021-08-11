import UIKit
import MapKit
//MapKit은 지도를 확대, 축소, 및 이동하는 등 지도에 관한 여러 기능을 제공한다.

class MapViewController: UIViewController {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
}
