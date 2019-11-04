//
//  ViewController.swift
//  GameOfLife
//
//  Created by Felipe Florencio Garcia on 04/11/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let gameOfLife = GameOfLife(grid: 15)
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameOfLife.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomCellTableViewCell.self)) as! CustomCellTableViewCell
        cell.setColumState(using: gameOfLife.grid[indexPath.row])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.gameOfLife.nextLifeCycle()
            self.tableView.reloadData()
        }
        
        return cell
    }
}
