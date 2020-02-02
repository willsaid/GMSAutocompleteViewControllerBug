//
//  ViewController.swift
//  GMS Autocomplete Dark Mode
//
//  Created by Will Said on 2/2/20.
//  Copyright © 2020 Will Said. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {
    
    let autocompleteController = GMSAutocompleteViewController()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        autocompleteController.delegate = self
        addPresentButton()
    }
    
    func addPresentButton() {
        let button = UIButton(frame: .init(origin: .init(x: 0, y: view.frame.height / 2),
                                           size: .init(width: view.frame.width, height: 100)))
        button.setTitle("Present Autocomplete", for: .normal)
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(presentAutocomplete), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func presentAutocomplete() {
        self.present(autocompleteController, animated: true)
    }

}

extension ViewController: GMSAutocompleteViewControllerDelegate {

    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        dismiss(animated: true, completion: nil)
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error)
        dismiss(animated: true, completion: nil)
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }

}


