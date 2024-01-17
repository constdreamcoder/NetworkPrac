import UIKit

// Swift FirstClassObject / Function Type
/*
 1. 변수/상수에 함수를 저장할 수 있어야 한다
 2. 함수의 반환값으로 함수를 사용할 수 있어야 한다.
 3. 함수의 인자값으로 함수를 전달할 수 있어야 한다.
 */

func hello() {
    print("안녕하세요 반갑습니다")
}

func hello(nickname: String) -> String {
    return "저는 \(nickname)입니다."
}

//func hello(username: String) -> String {
//    return "저는 \(username)입니다."
//}
//
func hello(name: String, age: Int) -> String {
    return "저는 \(name)이고 \(age)세 입니다."
}

//let value = hello // 함수 자체를 담음
//
//value()

let value2: (String) -> String = hello(nickname:)

value2("이상해")

//let value = hello(nickname: "고래밥")
//
//hello(username: "5656")
//
//hello(name: "7878", age: 13)


// () -> Void
func oddNumber() { // () -> Void
    print("홀수")
}

func evenNumber() { // () -> Void
    print("짝수")
}

func resultNubmer(base: Int, odd: () -> Void, even: () -> Void) {
    return base.isMultiple(of: 2) ? even() : odd()
}

resultNubmer(base: 15, odd: oddNumber, even: evenNumber)

resultNubmer(base: 17) {
    <#code#>
} even: {
    <#code#>
}


