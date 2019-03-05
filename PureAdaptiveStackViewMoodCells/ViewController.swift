//
//  ViewController.swift
//  PureAdaptiveStackViewMoodCells
//
//  Created by Brian Voong on 3/5/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

struct Feeling {
    let num: Int
    let mood: String
}

class ViewController: UITableViewController {

    let feelings: [Feeling] = {
        return (0..<100).map({ (_) -> Feeling in
            let intRandom = Int.random(in: 0..<100)
            let mood = intRandom < 50 ? (intRandom < 25 ? "🤩" : "😎") : (intRandom > 75 ? "🥶" : "🤬")
            return Feeling(num: intRandom, mood: mood)
        })
    }()
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FeelingCell.self, forCellReuseIdentifier: cellId)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feelings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FeelingCell
        let feeling = feelings[indexPath.row]
        cell.numLabel.text = String(feeling.num)
        cell.emojiLabel.text = feeling.mood
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

