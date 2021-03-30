
import Foundation

// 정렬된 값을 출력하고, 값의 빈도를 출력합니다.
#if false
func printValues(_ values: [String]) {
  print(values.sorted())

  var result = [String: Int]()
  for e in values {
    let v = result[e] ?? 0
    result[e] = v + 1
  }

  print(result)
}

let arr = [
  "hello",
  "world",
  "hello",
  "world",
  "hello",
  "world",
  "show",
  "me",
]
printValues(arr)
#endif

// 제약 사항이 여러 개 존재할 경우,
//  1) <T: Comparable & Hashable>
//  2) where T: Comparable & Hashable
#if false
func printValues<T: Comparable & Hashable>(_ values: [T]) {
  print(values.sorted()) // Comparable

  var result = [T: Int]() // Hashable
  for e in values {
    let v = result[e] ?? 0
    result[e] = v + 1
  }

  print(result)
}
#endif

func printValues<T>(_ values: [T])
  where T: Comparable & Hashable
{
  print(values.sorted()) // Comparable

  var result = [T: Int]() // Hashable
  for e in values {
    let v = result[e] ?? 0
    result[e] = v + 1
  }

  print(result)
}

let arr = [
  "hello",
  "world",
  "hello",
  "world",
  "hello",
  "world",
  "show",
  "me",
]
printValues(arr)

struct User {
  let name: String
  let age: Int
}

extension User : Comparable {
  static func < (lhs: User, rhs: User) -> Bool {
    return lhs.name < rhs.name
  }
}

// Java: equals / hashCode는 반드시 동시에 제공되어야 한다.
//  - hashCode
//  - equals

// => Swift는 Hashbale에서 Equtable을 상속하는 형태로 구현되어 있습니다.

extension User : Hashable {
  // Equtable
  static func == (lhs: User, rhs: User) -> Bool {
    return lhs.name == rhs.name && lhs.age == rhs.age
  }
  
  // Hashable
  func hash(into hasher: inout Hasher) {
    hasher.combine(name)
    hasher.combine(age)
  }
}

let arr2 = [
  User(name: "Tom", age: 42),
  User(name: "Bob", age: 100),
  User(name: "Tom", age: 42),
  User(name: "Bob", age: 100),
  User(name: "Tom", age: 42),
  User(name: "Bob", age: 100),
  User(name: "Tom", age: 42),
  User(name: "Bob", age: 100),
]
printValues(arr2)

