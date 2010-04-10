
type ChurchNumber[X] = ((X => X) => (X => X))
def identity[X] = ((x: X) => x)

def zero[X](f: X => X) = identity[X]

def add1[X](n: ChurchNumber[X]) = {
  (f: (X => X)) => { (x: X) => f(n(f)(x)) }
}

def one[X](f: X => X) = { (x: X) => f(x) }
def two[X](f: X => X) = { (x: X) => f(f(x)) }

def add[X](a: ChurchNumber[X], b: ChurchNumber[X]) = {
  (f: (X => X)) => { (x: X) => a(f)(b(f)(x)) }
}

// for testing:
def numberize(n: ChurchNumber[Int]) = { n((x: Int) => x + 1)(0) }

println(numberize(zero[Int]))
println(numberize(one[Int]))
println(numberize(two[Int]))
println(numberize(add(two[Int], one[Int])))
println(numberize(add(two[Int], two[Int])))
