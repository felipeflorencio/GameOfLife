//
//  GameOfLife.swift
//  GameOfLife
//
//  Created by Felipe Florencio Garcia on 04/11/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

class GameOfLife {
    
    var grid: [[Int]]!
    let cols: Int
    let rows: Int
    
    init(grid size: Int) {
        self.cols = size
        self.rows = size
        setup()
    }
    
    private func make2DArray(cols: Int, rows: Int) -> [[Int]] {
        var grid = Array(repeating: [1], count: cols)
        
        for row in 0..<cols {
            let rowArray = Array(repeating: 1, count: rows)
            grid[row] = rowArray
        }
        return grid
    }
    
    func setup() {
        
        grid = make2DArray(cols: cols, rows: rows)
        for i in 0..<cols {
            for j in 0..<rows {
                let number = Int.random(in: 0...1)
                grid[i][j] = number
            }
        }
    }
    
    func nextLifeCycle() {
        var next = make2DArray(cols: cols, rows: rows)
        
        // Compute next based on grid
        for i in 0..<cols {
            for j in 0..<rows {
                
                let state = grid[i][j]
               
                let neighbors = countLiveNeighbors(rowX: i, colY: j)
                
                // If dead and have 3 neighbor live we born
                if (state == 0 && neighbors == 3) {
                    next[i][j] = 1
                // if dead and less than 2 neighbors or more than 3 neighbors die
                } else if (state == 1 && (neighbors < 2 || neighbors > 3)) {
                    next[i][j] = 0
                } else {
                    // if none of those just continue the same state as before
                    next[i][j] = state
                }
            }
        }
        
        grid = next
    }
    
    func countLiveNeighbors(rowX: Int, colY: Int) -> Int {
        var sum = 0
        
        for i in -1...1 {
            for j in -1...1 {
                let col = (rowX + i + cols) % cols
                let row = (colY + j + rows) % rows
                
                sum += grid[col][row]
            }
        }
        
        // this is to remove ourself, the one that is in the 'center'
        sum -= grid[rowX][colY]
        return sum
    }
}
