//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Jimmy Brown on 4/22/20.
//  Copyright © 2020 Jimmy Brown. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
    
}

class ButtonTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
    
    // MARK: - Actions
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
} // End of Class




