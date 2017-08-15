//: Playground - noun: a place where people can play
//: Puchi hates to carry luggage, but unfortunately he got a job to carry the luggage of his N friends in office. Each day, one of his N friends, gives him the luggage of a particular weight to carry. You will be given the weight of luggage of each friend in the array Weight, where Weighti is the weight of luggage of ith friend carried by Puchi on ith day. It is given that all the luggages carried by Puchi are distinct in their weights.
//:As Prateek assigned this job to Puchi, so for each day, he wants to know the number of days in future when Puchi will have to carry the luggage , having weight less than the weight of luggage of current day.

//: Input: The first line contains a single integer T, denoting the number of test cases. In each test case, the following input will be present:
//:First line contains an integer N, where N represents the number of friends.
//:Next N line contains N integers, where ith line contains ith integer, which represents Weighti.

//: Output:Output exactly T lines. Each line contains N integer separated by a space, where ith integer represents the number of luggage of future, which are less than the weight of luggage of the current day.

class LuggageProblem {
    var count = 0
    func split(input: [Int], first: Int, last: Int, currentLuggage: Int) {
        if first < last {
            let mid = (first + last) / 2
            split(input: input, first: first, last: mid, currentLuggage: currentLuggage)
            split(input: input, first: mid + 1, last: last, currentLuggage: currentLuggage)
        }

        if currentLuggage > input[last] && first == last{
            count = count + 1
        }
    }

    func checkLuggage(input: [Int]) {
        for index in 0..<input.count {
            count = 0
            let currentLuggage = input[index]
            split(input: input, first: index + 1, last: input.count - 1, currentLuggage: currentLuggage)
            print("\(count) ")
        }
    }
}

var input = [2,3,1,2]
let test1 = LuggageProblem()
test1.checkLuggage(input: input)
