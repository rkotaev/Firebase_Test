//
//  ViewController.swift
//  brainstorm_test
//
//  Created by Kotaev Ruslan on 16.06.2021.
//
import FirebaseDatabase
import UIKit

class ViewController: UIViewController {

    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        database.child("something").observeSingleEvent(of: .value) { shapshot  in
            guard let value = shapshot.value as? [String: Any] else {
                return
            }
            print("Value: \(value)")
        }
        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width-40,height: 50))
        button.setTitle("Add Entry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        view.addSubview(button)
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
    }
    @objc func addNewEntry() {
        let object: [String: Any] = [
            "name": "Kotaev Ruslan" as NSObject,
            "Youtube": "Yes"
        ]
        database.child("something_\(Int.random(in: 0..<100))").setValue(object)
    }
    
}
