//: Playground - noun: a place where people can play

import UIKit

class MergeSort {
    func sort(input: inout [Int], first: Int, last: Int) {
        if first < last {
            let mid = (first + last) / 2
            sort(input: &input, first: first, last: mid)
            sort(input: &input, first: mid + 1, last: last)
            merge(input: &input, first: first, mid: mid, last: last)
        }
    }

    func merge(input: inout [Int], first: Int, mid: Int, last: Int) {
        let len1 = mid - first + 1
        let len2 = last - mid
        var leftArray = [Int]()
        var rightArray = [Int]()

        for i in 1...len1 {
            leftArray.insert(input[first + i - 1], at: i-1)
        }
        leftArray.append(Int.max)

        for j in 1...len2 {
            rightArray.insert(input[mid + j], at: j-1)
        }
        rightArray.append(Int.max)

        var leftIndex = 0
        var rightIndex = 0

        for k in first...last {
            if leftArray[leftIndex] <= rightArray[rightIndex] {
                input[k] = leftArray[leftIndex]
                leftIndex = leftIndex + 1
            }
            else {
                input[k] = rightArray[rightIndex]
                rightIndex = rightIndex + 1
            }
        }
    }
}


var input = [3,5,1,2,7,6]
let merge = MergeSort()
merge.sort(input: &input, first: 0, last: input.count - 1)
print(input)


