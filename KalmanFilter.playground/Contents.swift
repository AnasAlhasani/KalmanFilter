import Foundation

var kalman = Kalman(signals: [47, 43, 50, 55, 54, 56, 56, 59, 59, 50, 67, 49])
let filterdValue = kalman.filter()
print(filterdValue)
