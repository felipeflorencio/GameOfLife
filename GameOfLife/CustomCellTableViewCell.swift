//
//  CustomCellTableViewCell.swift
//  GameOfLife
//
//  Created by Felipe Florencio Garcia on 04/11/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    
    @IBOutlet var columns: UIStackView!
    
    func setColumState(using rowData: [Int]) {
        
        let alreadyHaveData = columns.arrangedSubviews.count > 0
        for column in rowData.enumerated() {
            
            let isLiveColor = column.element == 0 ?  UIColor.black : UIColor.white
            
            if alreadyHaveData {
                columns.arrangedSubviews[column.offset].backgroundColor = isLiveColor
            } else {
                let state = UIView()
                state.backgroundColor = isLiveColor
                state.heightAnchor.constraint(equalToConstant: 39.0).isActive = true
                state.widthAnchor.constraint(equalToConstant: 39.0).isActive = true
                
                columns.addArrangedSubview(state)
            }
        }
    }
}
