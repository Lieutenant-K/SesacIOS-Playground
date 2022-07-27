//: [Previous](@previous)

import Foundation

// 옵셔널로 선언된 프로퍼티는 nil을 가질 수 있기 때문에 나중에 초기화해도 된다.
// nil을 담을 수 없는 프로퍼티는 값이 무조건 있어야 하기 때문에 초기화가 필요하다.

class Monster {
    
    var name: String
    var level: Int
    
    init(name: String, level: Int){
        self.name = name
        self.level = level
    }
    
}

let easy = Monster(name:"졸개", level: 5)

var hard = easy

hard.name = "보스몬스터"
hard.level = 100

print(easy.name, easy.level)
print(hard.name, hard.level)

struct StructMonster {
    
    var name: String
    var level: Int
    
}

let structMonster = StructMonster(name: "멤버와이즈로 만든 이름", level: 10)
//: [Next](@next)
