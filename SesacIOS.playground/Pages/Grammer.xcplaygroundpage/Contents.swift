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

// ExpressibleByArrayLiteral

struct Point: ExpressibleByArrayLiteral {
    
    init(arrayLiteral elements: Int...) {
        
    }
    
    var x: Int = 0
    var y: Int = 0
    
}

let index: IndexPath = [1, 2]
print(index.row, index.section)

// Extension으로 추가된 메서드 상속
extension UIView {
    
    func inheritanceFunc() {
        
        print("UIView에 추가된 함수")
    }
    
}

class ViewView: UIView {
    
    
}

ViewView().inheritanceFunc()


// Property Wrapper

@propertyWrapper
struct UserDefault<T> {
    
    let key: String
    let defaultValue: T
    let storage: UserDefaults
    
    var wrappedValue: T {
        get { storage.object(forKey: key) as? T ?? self.defaultValue }
        set { storage.set(newValue, forKey: key) }
    }
    
}

class UserManager {
    
    @UserDefault(key: "userTouchID", defaultValue: false, storage: .standard)
    static var userTouchID: Bool
    
    @UserDefault(key: "myEmail", defaultValue: nil, storage: .standard)
    static var myEmail: String?
    
    @UserDefault(key: "isLoggedIn", defaultValue: false, storage: .standard)
    static var isLoggedIn: Bool
    
    
}


// 옵셔널 바인딩

var shoplist: String? = "신발 사기"
var shoplist2: String? = "모니터 사기"

if shoplist != nil {
    print("\(shoplist!) 완료!")
} else {
    print("글자를 입력해주세요")
}

// 2글자 이상을 꼭 입력해야 한다면?
shoplist = nil

if let jack = shoplist, let value = shoplist2, (2...6).contains(jack.count) {
    print("\(jack), \(value)")
} else {
    print("글자를 입력해주세요")
}

func optionalBindingFunction() {
    
    guard let jack = shoplist, let value = shoplist2, (2...6).contains(jack.count) else {
        print("글자를 입력해주세요")
        return
    }
    
    print("\(jack), \(value) 완료!")
    
}

// 인스턴스 프로퍼티와 타입 프로퍼티


class User {
    
    var nickname = "고래밥"
    static var staticNickname = "고래밥"
    
    deinit{
        
    }
    
}

let user = User()

User.staticNickname // 호출 시 메모리에 올라감. 인스턴스를 생성한다고 해서 초기화가 되지 않고 사용할때 초기화가 된다. 대신 한번 메모리에 올라가면 앱이 꺼질때까지 없어지지 않음

enum DrinkSize {
    case short, tall, grande, venti
}

class DrinkClass {
    
    let name: String
    var count: Int
    var size: DrinkSize
    
    init(name: String, count: Int, size: DrinkSize) {
        self.name = name
        self.count = count
        self.size = size
    }
    
}

struct DrinkStruct {
    
    let name: String
    var count: Int
    var size: DrinkSize
    
}


let drinkClass = DrinkClass(name: "블루베리서무디", count: 2, size: .venti)
drinkClass.count = 5
drinkClass.size = .tall

var drinkStruct = DrinkStruct(name: "블루베리서무디", count: 2, size: .venti)

drinkStruct.count = 5
drinkStruct.size = .tall


// lazy

struct Poster {
    
    var image: UIImage = UIImage(named: "star") ?? UIImage()
    
    
    // 메소드 오버로딩에 의해 여러 매개변수를 가진 초기화 구문 생성 가능
    init() {
        print("Poster Initailized")
    }
    
    init(defaultImage: UIImage) {
        image = defaultImage
    }
    
    init(customImage: UIImage? = UIImage(named: "star")) {
        image = customImage!
    }
    
}

struct MediaInfo {
    
    var mediaTitle: String
    var mediaRuntime: Int
    lazy var mediaPoster: Poster = Poster()
    
}

var media = MediaInfo(mediaTitle: "징징이게임", mediaRuntime: 123)

media.mediaPoster

struct Who {
    
    static var originalName = "진짜 이름"
    var nickname = "고래밥"
    
}

var user1 = Who()
user1.nickname = "칙촉"
Who.originalName = "홈런볼"

print(user1.nickname, Who.originalName)

var user2 = Who()
print(user2.nickname, Who.originalName)

struct BMI {
    
    var nickname: String
    var weight: Double
    var height: Double
    
    // 저장 프로퍼티는 메모리에 올라가지만 연산 프로퍼티는 저장 프로퍼티를 활용해서 원하는 값을 반환하는 용도로 사용
    var BMIResult: String {
        get {
            let bmiValue = (weight * weight) / height
            let bmiStatus = bmiValue < 18.5 ? "저체중" : "정상 이상"
            return "\(nickname)님의 BMI 지수는 \(bmiValue)로 \(bmiStatus)"
        }
        set {
            nickname = newValue
        }
        
    }
    
}

class FoodRestaurant {

    let name = "잭치킨"
    var totalOrderCount = 10
    
    var nowOrder: Int {
        get { return totalOrderCount * 5000 }
        set(jack) { totalOrderCount += jack } // 기본 파라미터 newValue, 변경 가능
        // set에서 newValue는 매개변수 취급, Stack 메모리 영역에 임시 저장
    }

}


// 열거형은 타입 자체 -> 인스턴스 생성이 불가능하다 -> 그래서 초기화 구문이 없다.
// 인스턴스 저장 프로퍼티 선언 불가
// 열거형은 컴파일 타임에 확정되어야 함. -> 메모리에 바로 올라가지 않는 인스턴스 연산 프로퍼티는 열거형에서 사용이 가능하다.
enum ViewType {
    
    case start
    case change
    
    var nickname: String {
        get {"닉네임"}
        set {Self.title = newValue}
    }
    
    static var title = "타이틀"
    
    static var realTitle: String {
        
        get { return "진짜" + title}
        set { title = "찐" + newValue }
        
    }
    
    
}


// 타입 프로퍼티는 인스턴스랑 상관없이 접근 가능 -> 따라서 열거형에서 타입 저장 프로퍼티, 타입 연산 프로퍼티 모두 사용 가능


// Property Observer
// 저장 프로퍼티에 주로 사용하고, 저장 프로퍼티의 값을 관찰하다가 값이 변경될때 호출됨
// willSet / didSet

class TypeFoodRetaurant {
    
    static let name = "치킨집" // 타입 상수 프로퍼티
    static var totalOrderCount = 10 {
        // 매개변수 이름 지정 가능
        willSet {
            print("총 주문 건수가 \(totalOrderCount)에서 \(newValue)로 변경될 예정입니다.")
            
        }
        didSet {
            print("총 주문 건수가 \(oldValue)에서 \(totalOrderCount)로 변경됐습니다.")
        }
    }
    
    static var nowOrder: Int {
        get {
            totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue
        }
    }
}

TypeFoodRetaurant.nowOrder = 15


// 메서드 : 타입 메서드 & 인스턴스 메서드

struct Coffee {
    
    static var name = "아메리카노"
    static var shot = 2
    var price = 4900
    
    mutating func plusShot() {
//        shot += 1
        price += 300
    }
    
    // 오버라이딩 가능한 타입 메소드
//    class func minusShot() {
//        shot -= 1
//    }
        
}
//
//class Latte: Coffee {
//
//    // 슈퍼클래스의 타입 메서드를 재정의해서 쓰고싶다면 class
//    override class func minusShot() {
//        <#code#>
//    }
//
//
//}
