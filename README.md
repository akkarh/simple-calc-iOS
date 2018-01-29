# simple-calc-iOS

Supports basic math operations: (+, -, *, /, %)

Extended math operations: avg, count, fact

Truncates to integer values unless there is at least one rational number in the input

### count: outputs the number of input elements
input format:
 - 2 count 4 count 6 count 8 count 10 = evaluates to 5
 - 1 count 4 count 2 = evaluates to 3
  
### avg: computes the avg of input elements
input format:
 - 2 avg 4 avg 6 avg 8 avg 10 = evaluates to 6
 - 1 avg 4 avg 2 = evaluates to 2
 - 1.0 avg 4 avg 2 = evaluates to 2.333..
  
### fact: calculates the factorial
input format:
 - 5 fact = 60
