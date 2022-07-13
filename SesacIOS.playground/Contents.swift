import UIKit

var email: String = "jack@jack.com"

var email2 : String?
email2 = "나중에 초기화된 이메일"

type(of: email)
type(of: email2)

var array = Array(repeating: 10, count: 1)

var array2: [Int]? = [Int](1...100)
print(array)
type(of: array2)

if array2?.count == 0 {
    print("값이 없습니다")
} else {
    print(array2?.count)
}

// 삼항 연산자
var result = array2 == nil ? "값이 없습니다." : "값이 있습니다."

func function1 () -> String {
    return "함수 1입니다"
}

func function2 () -> String {
    return "함수 2입니다."
}

result = array2 == nil ? function1() : function2()

func bmiResult() -> (String, Double) {
    
    let result = Double.random(in: 1...30)
    
    if result < 18.5 {
        return ("고래밥", 1.0)
    } else if result >= 18.5 && result < 23 {
        return ("고래밥", 2.0)
    } else {
        return ("고래밥", 3.0)
    }
    
}

let userBMI = bmiResult()
type(of: userBMI)

print("\(userBMI.0)님의 BMI 등급은 \(userBMI.1)입니다. ")

// swift 5.1 return 키워드 생략

@discardableResult
func randomNumber() -> Int {
    
    Int.random(in: 1...100)
    
}

randomNumber()

// 매개변수 기본값
func sayHello(userNickname: String = "손", gender: Int = 2) -> String {
    
    return userNickname + "님, 반갑습니다!"
}

sayHello(userNickname: "하이요")
print("안녕하세요~", separator: " ", terminator: "끝!")


// 열거형

enum Gender: String {
    case male
    case female
    case other
}

let gender = Gender.male

switch gender {
case .male:
    print("남성입니다 \(Gender.male.rawValue)")
case .female:
    print("여성입니다")
case .other:
    print("아무것도 아닙니다")
}

enum HTTPCode: Int {
    case OK
    case NO_PAGE
    case SERVER_ERROR = 404
    
    func showStatus() -> String {
        
        switch self {
        case .OK:
            return "정상입니다"
        case .NO_PAGE:
            return "페이지가 없습니다"
        case .SERVER_ERROR:
            return "서버 에러입니다."
            
            
        }
        
    }
}

var networkStatus = HTTPCode.SERVER_ERROR

let resultStatus = networkStatus.showStatus()
// Base Class, Super Class, Sub Class

class Monster {
    
    var clothes = "Orange"
    var speed = 5
    var power = 20
    var experience = 500
    
    func attck() {
        print("공격!")
    }
    
}

class BossMonster: Monster {
    
    var levelLimit = 500
    
    override var speed: Int {
        get {
            return levelLimit*2
        }
        set {
            
        }
    }
    
    func specialAttack(){
        
        print("특수 공격!")
    }
    
    override func attck() {
        super.attck()
        print(super.speed)
        print(self.speed)
        print("오버라이드 어택!")
    }
    
}

var easyMonster = Monster() // 초기화(인스턴스)
var boss = BossMonster()

easyMonster.attck()
boss.specialAttack()
boss.levelLimit
boss.experience = 1000
boss.attck()


struct Point {
    
    var x = 0
    var y = 2
    
}

func dateFormatStyle() {
    
    let value = Date()
    
    print(value)
    print(value.formatted(date: .omitted, time: .shortened))
    print(value.formatted(date: .complete, time: .shortened))
    
    let locale = Locale(identifier: "ko-KR")
    
    let result = value.formatted(.dateTime.locale(locale).day().month(.twoDigits).year())
    print(result)
    
    let result2 = value.formatted(.dateTime.day().month(.twoDigits).year())
    print(result2)
    
}

dateFormatStyle()

func numberFormatStyle() {
    
    print(50.formatted(.percent))
    print(18852348123.formatted())
    print(4561234523.formatted(.currency(code: "krw")))
    
    let result = ["안녕", "안녕", "나는", "지수야"].formatted(.list(type: .and, width: .standard))
    
    print(result)
    
}

numberFormatStyle()
