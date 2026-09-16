//: # Swift Exercise
//: Welcome to the Swift Exercise. This document is an interactive Playground. The goal of this exercise is to familiarize yourself with the Swift syntax, terminology and concepts.
//:
//: If this text you're currently reading is being displayed as a code comment with `//:`, you can make it look prettier by selecting `Editor` --> `Show Rendered Markup` in the menu bar at the very top of your screen. You can switch back to the raw markup by clicking `Editor` --> `Show Raw Markup`. The document is designed to be viewed in Rendered Markup mode.
//:
//: You can type your Swift code in here and it'll automatically compile.
//: If the automatic compilation annoys you, you can turn it off by clicking-and-holding your mouse on the "Play" icon in the toolbar below. Then, select `Manually Run`.
//:
//: If you need help or have any questions, please feel free to contact me. You can find my contact info on the [course website](https://avf.github.io/mobile-app-dev/). I'm always happy to help!
//:
//: ## How to do the exercises
//: - Follow the instructions for the exercises.
//: - Please write any code that I ask for right into the playground.
//: - Any time I ask a question in an exercise, **please add a comment with the explanation in your own words.**
//:
//: Here's an example:
//:
//: Write a Hello World program in Swift in a single line. Why is this a valid Swift program?

print("Hello, World!") // This works because Swift programs by default execute statements in the global scope. A `main` function or similar is not required.

//: ## Exercises
//: ### Variables and Constants
//: 1. Declare a variable with value `42` that is implicitly assigned type `Int`.
//: 1. Declare a constant with value `42` that is implicitly assigned type `Int`.
//: 1. Declare a variable with value `42.5`. What type does it have?
//: 1. Declare a variable with explicit type `Float` and value `42.5`.
//: 1. Declare an uninitialized constant with type `String`. Will you ever be able to assign a value to this constant?
var variable = 42
let constant = 42
var float = 42.5 // Float
var explicit: Float = 42.5
let uninitialized: String // yes
// uninitialized = "Hello World"
// print(uninitialized)
//: ### Strings and String interpolation
//: 1. Create a constant of type `String` containing the text `"This is a String."`.
//: 1. Create a mutable String with `"This is an Int: "` as its initial value.
//: 1. Create an `Int` constant with value 42 and append it to the mutable string, resulting in the value: `"This is an Int: 42"`.
//: 1. Create another constant containing the same string, but this time use a string literal and string interpolation (the `\()` syntax) to create it.
//: 1. Create a multiline string using the multiline string literal.
let constantString: String = "This is a String."
var mutableString = "This is an Int: "
let constantValue = 42
mutableString.append("\(constant)")
let interpolatedString: String = "This is an Int: \(constantValue)"
let multilineString: String = """
    multiline 
    string
    """
//: ### Arrays and Dictionaries
//: Arrays
//: 1. Create an immutable array and initialize it with an array literal containing 3 `String` elements
//: 1. Create an empty mutable array of type `[String]`
//: 1. Append the second element of the first (immutable) array to the second (mutable) array.
//: 1. Can you modify one of the `String` elements in the first array (for example, append a word to it)? Why/why not? What if the elements were not of type `String`, but instead of a class?
//: 1. What happens if you modify the `String` element in the second array (for example, if you append a word to it)? Will the second element in the first array also change, or stay the same? Explain why.
//: 1. Create an immutable empty array of type `[Int]` without any literals, using the name of the class (`Array`) and the standard initializer for generic types (`var value = ClassName<GenericType>()`)
let immutableArray = ["one", "two", "three"]
var mutableArray: [String] = []
mutableArray.append(immutableArray[1])

// No, you cannot modify a String element in `immutableArray` (e.g. mutableArray[0].append("!")), because
// `immutableArray` is a `let` constant and String is a value type (struct). Mutating an element means
// mutating the array itself (assigning a new copy of that element back into it), which requires the array
// to be a `var`. 

// Appending a word to the second element in `mutableArray` does NOT change the corresponding element in
// `immutableArray`. String is a value type, so when it was appended into `mutableArray` a full copy of the
// value was made. The two arrays now hold independent copies, so modifying one has no effect on the other.

let emptyIntArray = Array<Int>()

//: Dictionaries
//: 1. Create a mutable empty Dictionary of type `[String: Double]`
//: 1. Set the value for the key `"Answer to Life, the Universe and Everything"` to `42`.

var mutableDictionary: [String: Double] = [:]
mutableDictionary["Answer to Life, the Universe and Everything"] = 42

//: ### Optionals
//: 1. Create an optional `String` variable and assign a non-nil value of your choice
//: 1. Print the String on the console. Make sure the variable is first unwrapped and only the actual value is printed. You may either force-unwrap the string or use an `if let` construct.
//: 1. What happens if you force-unwrap an optional variable that contains `nil`?
//: 1. Create another optional `String` variable and asign the value `nil`. Use the nil coalescing operator (`??`) to print the first unwrapped String from above.
//: 1. Do the same thing again, but this time use the ternary conditional operator `(a ? b : c)`.

var optionalString: String? = "Hello, Optionals!"

if let unwrapped = optionalString {
    print(unwrapped)
}

// Force-unwrapping an optional that contains `nil` (e.g. `nilString!`) causes a runtime crash
// (a "Fatally unwrapped an Optional value" trap). The compiler can't guarantee the value exists,
// so trying to unwrap `nil` is treated as a programmer error and the app terminates immediately.

var nilString: String? = nil
print(nilString ?? optionalString!)

print(nilString != nil ? nilString! : optionalString!)

//: Optional chaining
//: 1. Consider the following `struct`. Use optional chaining to change the value of `anOptionalInt` in `instance` to a new value of your choice in a single line of code. What would happen if we executed that line while `instance` is `nil`?
//: 1. Use the `if let` conditional and optional chaining to print the value of `anOptionalInt` in `instance`. What would happen if `instance` or `anOptionalInt` were `nil`?
//: 1. Use optional chaining to call the method `sayHelloWorld` of `instance`. What would happen if `instance` were `nil`?

struct MyStruct {
    var anOptionalInt: Int? = 5

    func sayHelloWorld() {
        print("Hello, World!")
    }
}

var instance: MyStruct? =  MyStruct()

instance?.anOptionalInt = 10
// If `instance` were `nil`, this line would simply do nothing (no crash). Optional chaining short-circuits:
// the assignment is only performed if `instance` successfully unwraps, otherwise the whole expression
// evaluates to `nil` and is skipped.

if let anOptionalIntValue = instance?.anOptionalInt {
    print(anOptionalIntValue)
}
// If `instance` or `anOptionalInt` were `nil`, `instance?.anOptionalInt` would evaluate to `nil`,
// the `if let` condition would fail, and the print statement inside would simply not execute.

instance?.sayHelloWorld()
// If `instance` were `nil`, this line would do nothing - the method call is skipped because optional
// chaining short-circuits on a `nil` value instead of crashing.

//: ### Control flow
//: 1. Write a `for-in` loop that sums up all the values in `myNumbers`.
//: 1. Create an empty mutable `[Int: Int]` dictionary. Use a `for-in` loop to iterate over the elements in `myNumbers` and add each value to the dictionary, using the index of each element in `myNumbers` as its key. So for example, the dictionary should contain the key/value pair `0:12`, because 12 is element 0 of `myNumbers`.

let myNumbers = [12, 23, 1, 104]

var sum = 0
for number in myNumbers {
    sum += number
}
print(sum)
    
var emptyDict: [Int: Int] = [:]
for (index, number) in myNumbers.enumerated() {
    emptyDict[index] = number
}
print(emptyDict)
//: ### Functions and Closures
//: Functions
//: 1. Declare and call a function without any parameters or return type that prints Hello World.
//: 1. Declare and call a function that takes two strings as parameters and returns a string. Remember that in Swift, most funtions have argument labels. Make sure to include them, you don't need to modify the argument labels in any way.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time remove the first argument label.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time make the first argument label **different** from the parameter name (=use a custom argument label).
//: 1. Declare a function with a default parameter value. Call the function twice, once with the argument present, once without.
//: 1. Declare a function with name `callAFunction` that takes another function as parameter and then executes it. Call your newly declared `callAFunction` and pass in one of the functions you previously declared.

func sayHelloWorld() {
    print("Hello, World!")
}
sayHelloWorld()

func combine(firstString: String, secondString: String) -> String {
    return "\(firstString) \(secondString)"
}
print(combine(firstString: "Hello", secondString: "World"))

func combineNoFirstLabel(_ firstString: String, secondString: String) -> String {
    return "\(firstString) \(secondString)"
}
print(combineNoFirstLabel("Hello", secondString: "World"))

func combineCustomLabel(with firstString: String, secondString: String) -> String {
    return "\(firstString) \(secondString)"
}
print(combineCustomLabel(with: "Hello", secondString: "World"))

func greet(name: String = "World") -> String {
    return "Hello, \(name)!"
}
print(greet())
print(greet(name: "Swift"))

func callAFunction(function: () -> Void) {
    function()
}
callAFunction(function: sayHelloWorld)

//: Closures
//: 1. Create an optional variable that holds a closure (with a `String` parameter and no return type) and assign `nil`.
//: 1. Call the closure using optional chaining. What will happen?
//: 1. Create a `typealias` for this type of closure.

var optionalClosure: ((String) -> Void)? = nil

optionalClosure?("Hello, Closures!")
// Calling `optionalClosure?(...)` on a `nil` closure does nothing and does not crash. Just like optional
// chaining on a property or method, the call is only performed if the closure successfully unwraps -
// since it's `nil` here, the whole expression short-circuits to `nil` and the closure body never runs.

typealias StringClosure = (String) -> Void

//: 1. Take a look at the following function, which takes a closure as parameter and calls it. This function is then called. For each of the following exercises, call the function again, but each time use one more simplification:
//:   * Omit closure parameter types.
//:   * Omit the closure return type
//:   * Omit the round brackets and argument label (we can do that since it's the last function parameter)
//:   * Omit the closure parameters completely. In the closure body, use the shorthand argument names (for example `$0`)
//:   * Omit the keyword `return`

func callAClosure(closure: (String, String) -> String) {
    print(closure("Hello", "World"))
}
callAClosure(closure: { (item1: String, item2: String) -> String in
    return "\(item1) \(item2)"
})

// Omit closure parameter types
callAClosure(closure: { item1, item2 -> String in
    return "\(item1) \(item2)"
})

// Omit the closure return type
callAClosure(closure: { item1, item2 in
    return "\(item1) \(item2)"
})

// Omit the round brackets and argument label
callAClosure { item1, item2 in
    return "\(item1) \(item2)"
}

// Omit the closure parameters completely, use shorthand argument names
callAClosure {
    return "\($0) \($1)"
}

// Omit the keyword `return`
callAClosure {
    "\($0) \($1)"
}


//: ### Classes
//: 1. Create a new class named `Person`. Add non-optional `firstName` and `lastName` properties and an initializer.
//: 1. Add a `name` computed property that returns a `String` containing the first and last name.
//: 1. Add a method named `greet` that returns the following `String`: `"Hi, I'm \(name)."`
//: 1. Create a subclass of `Person` and name it `Student`.
//: 1. Add a `Float?` optional property called `grade`. Use the `didSet` property observer to make sure that the grade is not lower than 1.0 and not higher than 5.0 after it was set. Clamp the new value to this interval - so if a value higher than 5.0 is set, set it to 5.0 afterwards. If a value lower than 1.0 is set, set it to 1.0 afterwards.
//: 1. Override the `greet` function from the superclass. If the `grade` property is set, it should now return `"Hi, I'm \(name). My grade is: \(grade)"`. If the `grade property isn't set, return the superclass's implementation.

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    var name: String {
        return "\(firstName) \(lastName)"
    }

    func greet() -> String {
        return "Hi, I'm \(name)."
    }
}

class Student: Person {
    var grade: Float? {
        didSet {
            guard let grade = grade else { return }
            if grade > 5.0 {
                self.grade = 5.0
            } else if grade < 1.0 {
                self.grade = 1.0
            }
        }
    }

    override func greet() -> String {
        guard let grade = grade else {
            return super.greet()
        }
        return "Hi, I'm \(name). My grade is: \(grade)"
    }
}

//: ### Enums and Structs
//: 1. Create an enum named `PetType` with cases `dog` and `cat`
//: 1. In your new enum, create a function or computed property named `animalSound` that returns a `String`. Use a `switch` statement on `self` to differentiate between the cases and return `"woof"` for the `.dog` case and `"meow"` for the `.cat` case.
//: 1. Create a structure named `Pet`, with a `name` property of type `String` and a `type` constant of type `PetType` (both non-optional).
//: 1. Add a function to your structure named `makeNoise` that returns a `String`. In its implementation, return the `animalSound` of its `type`.
//: 1. Create 3 or more instances of your `Pet` struct and store them in `let` constants. Then create a new array that contains all your pets and store it in a variable.
//: 1. Change one of the names of the pets in your array. Does this change the name of any of the pets stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the pets stored in the `let` constants? Explain why/why not.
//: 1. Create 3 or more instances of your `Student` class from above and store them in `let` constants. Then create a new array that contains all your students and store it in a variable.
//: 1. Change one of the names of the students in your array. Does this change the name of any of the students stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the students stored in the `let` constants? Explain why/why not.

enum PetType {
    case dog
    case cat

    var animalSound: String {
        switch self {
        case .dog:
            return "woof"
        case .cat:
            return "meow"
        }
    }
}

struct Pet {
    var name: String
    let type: PetType

    func makeNoise() -> String {
        return type.animalSound
    }
}

let pet1 = Pet(name: "Pet1", type: .dog)
let pet2 = Pet(name: "Pet2", type: .cat)
let pet3 = Pet(name: "Pet3", type: .dog)
var pets = [pet1, pet2, pet3]

pets[0].name = "Changed"
// This does NOT change `pet1.name`. `Pet` is a struct (value type), so putting `pet1` into the `pets`
// array copied its value. `pets[0]` is an independent copy - mutating it has no effect on `pet1`.

// pet1.name = "Changed" // This would not compile: `pet1` is a `let` constant, so none of its properties -
// even `var` ones - can be mutated, since mutating a struct property requires reassigning the whole struct.

let student1 = Student(firstName: "First", lastName: "Student")
let student2 = Student(firstName: "Second", lastName: "Student")
let student3 = Student(firstName: "Third", lastName: "Student")
var students = [student1, student2, student3]

students[0].firstName = "Changed"
// This DOES change `student1.firstName` too. `Student` is a class (reference type), so `students[0]` and
// `student1` refer to the exact same object in memory - mutating one is mutating the other.

student1.firstName = "Changed"
// You CAN change a property of `student1` even though it's a `let` constant, because `let` only prevents
// reassigning the constant itself to point to a *different* object. It doesn't make the object immutable -
// its own `var` properties can still be mutated through the reference.

//: ### Protocols and extensions
//: 1. Create a protocol called `NamedThing`. Add a `get` variable of type `String`, with the name `name`.
//: 1. Use extensions to make your `Person` class and `Pet` structs from above conform to the new protocol.
//: 1. Create a new array that contains all the objects you declared as `let` constants above. You may have to explicitly specify the type of the array as `[NamedThing]`.
//: 1. Iterate over the objects in the array and print out their names.
//: 1. Create a protocol extension for `NamedThing` that contains a new computed property of type `String` called `initial`. Add a default implementation in your protocol extension, which returns the first character of the `name` property, or, if `name` is empty, an empty string.
//: 1. Print the new `initials` property in the loop you created above.

protocol NamedThing {
    var name: String { get }
}

extension Person: NamedThing {}
extension Pet: NamedThing {}

let namedThings: [NamedThing] = [pet1, pet2, pet3, student1, student2, student3]

for namedThing in namedThings {
    print(namedThing.name)
}

extension NamedThing {
    var initial: String {
        return name.isEmpty ? "" : String(name.first!)
    }
}

for namedThing in namedThings {
    print(namedThing.initial)
}
