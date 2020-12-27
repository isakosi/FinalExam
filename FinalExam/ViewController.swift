//
//  ViewController.swift
//  FinalExam
//
//  Created by Sultan Isakov on 12/27/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var addWordButton: UIButton!
    @IBOutlet weak var showMessageButton: UIButton!
    @IBOutlet weak var list: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        list.delegate = self
        list.dataSource = self
    }
    
    private var wordList = [String]()
    
    @IBAction func addWord(_ sender: Any) {
        if let word = input.text {
            wordList.append(word)
            self.list.reloadData()
            input.text = ""
        }
    }
    
    var fullmsg = ""
//    var msg = ""
    @IBAction func showMessage(_ sender: Any) {
        
        for i in wordList {
            fullmsg +=  i + " "
            
        }
        
        let alert = UIAlertController(title: "Full message", message: fullmsg, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    
//    func translate (word: String) -> String {
//        let url = URL(string: "https://aucatranslator.azurewebsites.net/api/v1/wordtranslation/?word=" + word)!
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { return }
//            self.msg += String(data: data, encoding: .utf8)!
//
//        }
//
//        task.resume()
//        return msg
//
//    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexP: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexP)
        
        cell.textLabel?.text = wordList[indexP.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordList.count
    }
}

