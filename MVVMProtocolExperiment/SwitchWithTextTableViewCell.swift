//
//  SwitchWithTextTableViewCell.swift
//  MVVMProtocolExperiment
//
//  Created by Natasha Murashev on 8/16/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

// The data source for the cell.
protocol SwitchWithTextCellDataSource {
    var title: String { get }
    var switchOn: Bool { get }
}

// The delegate for the cell.
protocol SwitchWithTextCellDelegate {
    func onSwitchTogleOn(_ on: Bool)
    
    var switchColor: UIColor { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

// A protocol extension allows us to set defaults for a protocol.
// These are the immediate implementations of a method or property.
extension SwitchWithTextCellDelegate {
    
    var switchColor: UIColor {
        return .purple
    }
    
    var textColor: UIColor {
        return .black
    }
    
    var font: UIFont {
        return .systemFont(ofSize: 17)
    }
}

class SwitchWithTextTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var label: UILabel!
    @IBOutlet fileprivate weak var switchToggle: UISwitch!

    fileprivate var dataSource: SwitchWithTextCellDataSource?
    fileprivate var delegate: SwitchWithTextCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withDataSource dataSource: SwitchWithTextCellDataSource, delegate: SwitchWithTextCellDelegate?) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        label.text = dataSource.title
        switchToggle.isOn = dataSource.switchOn
        // color option added!
        switchToggle.onTintColor = delegate?.switchColor
    }

    @IBAction func onSwitchToggle(_ sender: UISwitch) {
        delegate?.onSwitchTogleOn(sender.isOn)
    }
}
