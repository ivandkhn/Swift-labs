var showDouble = false
let x: Double = 0.1
let y: Float = 0.3
for i in 1...10 where i % 2 == 0 {
    print(showDouble ? x : y)
    showDouble.toggle()
}
