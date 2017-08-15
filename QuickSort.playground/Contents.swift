class QuickSort {
    func partition(input: inout [Int], first: Int, last: Int) -> Int {
        let partitionElement = input[last]
        var i = first - 1
        for j in first...last - 1 {
            if input[j] <= partitionElement {
                i = i + 1
                exchange(input: &input,item1: j, item2: i)
            }
        }
        exchange(input: &input, item1: i+1, item2: last)
        return i + 1
    }

    func exchange(input: inout [Int], item1: Int, item2: Int) {
        let temp = input[item1]
        input[item1] = input[item2]
        input[item2] = temp
    }

    func quickSort(input: inout [Int], first: Int, last: Int) {
        if first < last {
            let partitionIndex = partition(input: &input,first: first,last: last)
            quickSort(input: &input,first: first,last: partitionIndex - 1)
            quickSort(input: &input,first: partitionIndex + 1,last: last)
        }
    }
}

var input = [7,4,3,2,1]
let sort1 = QuickSort()
sort1.quickSort(input: &input,first: 0,last: input.count-1)
print(input)