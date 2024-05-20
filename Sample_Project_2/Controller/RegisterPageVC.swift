import UIKit

class RegisterPageVC: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var addressTextView: UITextView!
    
    @IBOutlet weak var fathersNameTextField: UITextField!
    
    @IBOutlet weak var mothersNameTextField: UITextField!
    @IBOutlet weak var favoriteColorTextField: UITextField!
    @IBOutlet weak var favoriteFoodTextField: UITextField!
    @IBOutlet weak var favoriteCarTextField: UITextField!
    @IBOutlet weak var favoritePlaceTextField: UITextField!
    @IBOutlet weak var favoriteFootballPlayerTextField: UITextField!
    @IBOutlet weak var favoriteMovieTextField: UITextField!
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    

    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let username = nameTextField.text , !username.isEmpty,
              let ageString = ageTextField.text , !ageString.isEmpty,
              let age = Int(ageString),age>0,
              let address = addressTextView.text, !address.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let fathersName = fathersNameTextField.text,!fathersName.isEmpty,
              let mothersName = mothersNameTextField.text,!mothersName.isEmpty,
              let favoriteColor = favoriteColorTextField.text,!favoriteColor.isEmpty,
              let favoriteFood = favoriteFoodTextField.text,!favoriteFood.isEmpty,
              let favoriteCar = favoriteCarTextField.text, !favoriteCar.isEmpty,
              let favoritePlace = favoritePlaceTextField.text, !favoritePlace.isEmpty,
              let favoriteFootballPlayer = favoriteFootballPlayerTextField.text,!favoriteFootballPlayer.isEmpty,
              let favoriteMovie = favoriteMovieTextField.text,!favoriteMovie.isEmpty else {
            let alert = UIAlertController(title: "Please Enter Credentials", message: "All Fields are required", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        if userManager.retrieveUser(username: username) != nil{
            let alert = UIAlertController(title: "Username Taken", message: "Please choose a different username", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        let selectedGender = genderSegmentedControl.selectedSegmentIndex == 0 ? "Male" : "Female"
        
        let user = User(name: username, age: age, gender: selectedGender, address: address, password: password, fathersName: fathersName, mothersName: mothersName, favoriteColor: favoriteColor, favoriteFood: favoriteFood, favoriteCar: favoriteCar, favortiePlace: favoritePlace, favoriteFootballPlayer: favoriteFootballPlayer, favoriteMovie: favoriteMovie)
        userManager.storeUser(user: user)
        
        print("User Registration Successful")
        print("Name \(username )")
        print("Age \(age)")
        print("Address \(address)")
        print("Gender: \(genderSegmentedControl.titleForSegment(at: genderSegmentedControl.selectedSegmentIndex) ?? "Unknown")")
        print("Password: \(password)")
        
        let homeVC = storyboard?.instantiateViewController(identifier:viewcontrollers.HomeVC.rawValue) as! HomeVC
        homeVC.userData = user
        navigationController?.pushViewController(homeVC, animated: true)
        
    }
    

}
