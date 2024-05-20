import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    let userManager = UserManager()
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let username = nameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else{
              showAlert(title: "Please Enter Credentials", message: "All Fields are required")
            return
        }
        
        if let user = userManager.retrieveUser(username: username){
            if user.password == password{
                let homeVC = storyboard?.instantiateViewController(identifier:viewcontrollers.HomeVC.rawValue) as! HomeVC
                homeVC.userData = user
                navigationController?.pushViewController(homeVC, animated: true)
            }else {
                print("Login Failed")
                showAlert(title: "Login Error", message: "Incorrect Password")
            }
        } else {
            showAlert(title: "Login Error", message: "Invalid Username")
        }
    }
              
    func showAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true

    }
    

  

}
