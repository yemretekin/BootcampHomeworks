//
//  ViewController.swift
//  RandomQuoteApp
//
//  Created by Emre Tekin on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
        getData()
        
        }
            
    @IBAction func buttonClicked(_ sender: UIButton) {
        getData()
        }
    
    func getData(){
        Client.getSpells { randoms, error in
            guard let firstRandom = randoms else { return }
                        //print(firstRandom)
            self.quoteLabel.text = firstRandom.en
            self.authorLabel.text = firstRandom.author
            self.quoteLabel.adjustsFontSizeToFitWidth = true
            self.authorLabel.adjustsFontSizeToFitWidth = true
    }
}
}






