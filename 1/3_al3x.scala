// SICP Exercise 1.3
//
// Define a procedure that takes three numbers as arguments and returns
// the sum of the squares of the two larger numbers.

def square(x: Int): Int = x * x

def sumOfSquaresLargerTwo(x: Int, y: Int, z: Int): Int = {
  val largerTwo = List(x, y, z).sort((e1, e2) => (e1 < e2)).tail
  largerTwo.map(square).reduceLeft(_ + _)
}

// test it
assert(sumOfSquaresLargerTwo(1, 2, 3) == 13)
