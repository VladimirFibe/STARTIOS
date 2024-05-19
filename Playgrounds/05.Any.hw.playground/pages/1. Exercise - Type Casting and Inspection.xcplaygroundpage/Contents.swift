/*:
 ## Упражнение - приведение типов и их контроль
 
 1.1 Создайте коллекцию типа [Any], включающую несколько дробных чисел, целых, строк и значений логического типа. Выведите содержимое коллекции на консоль.
 */
let items: [Any] = [1, 7, 8.5, 3.8, "Привет", false]
print(items)
/*:
 1.2 Переберите коллекцию и для каждого целого числа выведите на консоль "Целое число " и его значение. Повторите то же самое для дробных чисел, строк и булевых значений.
 */
items.forEach {
    if let value = $0 as? Int {
        print("Целое число ", value)
    } else if let value = $0 as? Double {
        print("Дробное число", value)
    } else if let value = $0 as? String {
        print("Строка ", value)
    } else if let value = $0 as? Bool {
        print ("Булевое значение ", value)
    }
}

/*:
 1.3 Создайте словарь [String : Any], где все значения — это смесь дробных и целых чисел, строк и булевых значений. Переберите словарь и выведете на консоль пары ключ/значения для всех элементов коллекции.
 */
let values: [String: Any] = ["возраст": 54, "вес": 90.0, "женат": true, "имя": "Владимир", "фамилия": "Файб", "рост": "185"]
for (key, value) in values {
    print(key, value)
}
/*:
 1.4 Создайте переменную `total` типа `Double`, равную 0. Переберите все значения словаря, и добавьте значение каждого целого и дробного числа к значению вашей переменной. Для каждой строки добавьте 1. Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`. Выведите на консоль значение `total`.
 */
var total = 0.0

for (_, value) in values {
    if let number = value as? Int {
        total += Double(number)
    } else if let number = value as? Double {
        total += number
    } else if value is String {
        total += 1
    } else if let flag = value as? Bool {
        total += flag ? 2 : -3
    }
}
print("total", total)
/*:
 1.5 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему. Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0
for (_, value) in values {
    if let number = value as? Int {
        total += Double(number)
    } else if let number = value as? Double {
        total += number
    } else if let string = value as? String, let number = Double(string) {
        total += number
    }
}
print("total", total)

//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
