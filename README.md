# GameOfLife
Simple implementation for the GameOfLife challenge

This is a simulation proposal from John Horton Conway , you can read more about it here: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

This are the rules:

The universe of the Game of Life is an infinite, two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, live or dead, (or populated and unpopulated, respectively). Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

Any live cell with fewer than two live neighbours dies, as if by underpopulation.

Any live cell with two or three live neighbours lives on to the next generation.

Any live cell with more than three live neighbours dies, as if by overpopulation.

Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

These rules, which compare the behavior of the automaton to real life, can be condensed into the following:

Any live cell with two or three live neighbours survives.

Any dead cell with three live neighbours becomes a live cell.

All other live cells die in the next generation. Similarly, all other dead cells stay dead.


It's just a simple implementation were I used Table View to show live, it's more about the "core" algorith then the UI it self.

If you are curious about the algorith take a look
