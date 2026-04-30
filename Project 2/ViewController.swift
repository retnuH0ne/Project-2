import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!    
    @IBOutlet weak var tableView: UITableView!
    //initial location
    let initialLocation = CLLocation(latitude: 21.27904, longitude:-157.82722)
    let regionRadius: CLLocationDistance = 500
    let restaurantTitles: [String] = ["Waikiki Shokudo", "Topped Waikiki", "Earl's Kitchen + Bar", "Hula Grill Waikiki", "Duke's", "Paia Fish Market"]
    let restaurantSubTitles: [String] = ["4.5/5, Miso Butterfish", "4.5/5, Tofu Bibimbap", "4.9/5 USDA Prime Ribeye", "4.4/5, Kimo's Original Hula Pie", "4.4/5, Poke Tacos", "4.6/5, Seafood Pasta"]
    let restaurantImages: [UIImage] = [UIImage(named: "shokudo")!, UIImage(named: "topped")!, UIImage(named: "earls")!, UIImage(named: "hulaGrill")!, UIImage(named: "dukes")!, UIImage(named: "paia")!]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let text = restaurantTitles[indexPath.row]
        
        cell.textLabel?.text = text
        
        cell.imageView?.image = restaurantImages[indexPath.row]
        
        cell.detailTextLabel?.text = restaurantSubTitles[indexPath.row]
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centerMapOnLocation(location: initialLocation)
        
        //add our first annotation to the map
        let restaurantOne = restaurantObject(title: "Waikiki Shokudo", type: "Japanese", coordinate: CLLocationCoordinate2D(latitude: 21.28056, longitude: -157.82785), fave: "Miso Butterfish")
        let restaurantTwo = restaurantObject(title: "Topped Waikiki", type: "Korean", coordinate: CLLocationCoordinate2D(latitude: 21.28003, longitude: -157.82844), fave: "Tofu Bibimbap")
        let restaurantThree = restaurantObject(title: "Earl's Kitchen + Bar", type: "Kitchen and Bar", coordinate: CLLocationCoordinate2D(latitude: 21.27852, longitude: -157.82787), fave: "Prime Ribeye")
        let restaurantFour = restaurantObject(title: "Hula Grill Waikiki", type: "Hawaiian", coordinate: CLLocationCoordinate2D(latitude: 21.27720, longitude: -157.82759), fave: "Kimo's Original Hula Pie")
        let restaurantFive = restaurantObject(title: "Duke's", type: "Seafood", coordinate: CLLocationCoordinate2D(latitude: 21.27691, longitude: -157.82790), fave: "Poke Tacos")
        let restaurantSix = restaurantObject(title: "Paia Fish Market", type: "Seafood", coordinate: CLLocationCoordinate2D(latitude: 21.27972, longitude: -157.82646), fave: "Seafood Pasta")
        mapView.addAnnotation(restaurantOne)
        mapView.addAnnotation(restaurantTwo)
        mapView.addAnnotation(restaurantThree)
        mapView.addAnnotation(restaurantFour)
        mapView.addAnnotation(restaurantFive)
        mapView.addAnnotation(restaurantSix)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}

