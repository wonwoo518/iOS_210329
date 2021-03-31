
import Foundation

// Sequence 프로토콜을 구현하는 컬렉션은 다양한 기능을 사용할 수 있습니다.
//  - map: 데이터를 변환하다.
//  - filter: 데이터를 조건에 따라 필터한다.
// -----------
//  - sorted: 정렬된 데이터를 얻어온다.
//  - shuffled: 데이터를 랜덤으로 섞는다.

// let arr = 0..<1000  // 0..<1000 : Range
// 0...1000 : ClosedRange

// 1. lazy: 많은 데이터를 다룰 때 유용합니다.
//       - 중첩된 클로저의 연산을 한번에 처리합니다.
//       - 결과를 얻기 위해서는 순회가 필요하다.
// let arr = 0 ..< Int.max
let arr = 0 ..< Int.max

// 1000개 -> filter -> map -> suffix(3)
// -------
// 1개씩 - filter - map
// 1개씩 - filter - map
// 1개씩 - filter - map
// -------
#if false
let result = arr
  .lazy
  .filter { e -> Bool in
    e.isMultiple(of: 22)
  }
  .map { e in
    e / 11
  }
  .suffix(3)

print(result)
for e in result {
  print(e)
}

print("-------------")
#endif

// 2. reduce: 여러 요소를 통해 하나의 결과를 도출한다.
let text = """
hello
world
show
me
the
money
"""

var result = 0
for char in text {
  if char == "\n" {
    result += 1
  }
}

print(result)

let newlineCount = text.reduce(0) { (result, char) -> Int in
  // print(char)
  if char == "\n" {
    return result + 1
  } else {
    return result
  }
}

print(newlineCount)

let scores = [77, 56, 65, 80, 92, 100, 80, 92, 100, 55, 42, 75]

// [String: Int]

// 문제점: 요소의 개수가 많을 경우, temp = result 복사 비용의 증가도 고려되어야 한다.
let stat1 = scores.reduce([String: Int]()) { result, score in
  var temp = result
  switch score {
  case 0 ..< 70:
    #if false
    if let v = temp["D"] {
      temp["D"] = v + 1
    }
    #endif
    temp["D", default: 0] += 1
  case 70 ..< 80:
    temp["C", default: 0] += 1

  case 80 ..< 90:
    temp["B", default: 0] += 1
  case 90...:
    temp["A", default: 0] += 1
  default:
    break
  }
  return temp
}

let stat2 = scores.reduce(into: [:]) { (result: inout [String: Int], score: Int) in
  switch score {
  case 0 ..< 70:
    result["D", default: 0] += 1
  case 70 ..< 80:
    result["C", default: 0] += 1
  case 80 ..< 90:
    result["B", default: 0] += 1
  case 90...:
    result["A", default: 0] += 1
  default:
    break
  }
}
print(stat2)



print(stat1)
