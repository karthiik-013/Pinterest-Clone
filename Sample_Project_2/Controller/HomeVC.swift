import UIKit

class HomeVC: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet weak var fathersNameLabel: UILabel!
    @IBOutlet weak var mothersNameLabel: UILabel!
    @IBOutlet weak var favoriteColorLabel: UILabel!
    @IBOutlet weak var favoriteFoodLabel: UILabel!
    @IBOutlet weak var favoriteCarLabel: UILabel!
    @IBOutlet weak var favoritePlaceLabel: UILabel!
    @IBOutlet weak var favoriteFootballPlayerLabel: UILabel!
    @IBOutlet weak var favoriteMovieLabel: UILabel!
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
            }
    
    var userData: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        guard let userData = self.userData else {
            return
        }
        nameLabel.text = userData.name
        ageLabel.text = String(userData.age)
        genderLabel.text = userData.gender
        addressLabel.text = userData.address
        fathersNameLabel.text = userData.fathersName
        mothersNameLabel.text = userData.mothersName
        favoriteColorLabel.text = userData.favoriteColor
        favoriteFoodLabel.text = userData.favoriteFood
        favoriteCarLabel.text = userData.favoriteCar
        favoritePlaceLabel.text = userData.favortiePlace
        favoriteFootballPlayerLabel.text = userData.favoriteFootballPlayer
        favoriteMovieLabel.text = userData.favoriteMovie
    }
    
    

    

}
