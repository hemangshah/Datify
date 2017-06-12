# Datify 🕛

Easypeasy date functions.

![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)
![Platform](https://img.shields.io/badge/Platforms-iOS-red.svg)
![Swift 3.x](https://img.shields.io/badge/Swift-3.x-blue.svg) 
![MadeWithLove](https://img.shields.io/badge/Made%20with%20%E2%9D%A4-India-green.svg)
[![Blog](https://img.shields.io/badge/Blog-iKiwiTech.com-blue.svg)](http://www.ikiwitech.com)

Usage:

    print("now:                   \(Date.init())")
    print("8 days later:          \(8.days.fromNow)")
    print("2 weeks before:        \(2.weeks.ago)")
    print("5 days, 3 month later: \((5.days + 3.months).fromNow)")
  
Output:
 
    now:                   2017-06-06 10:42:23 +0000
    8 days later:          2017-06-14 10:42:23 +0000
    2 weeks before:        2017-05-23 10:42:23 +0000
    5 days, 3 month later: 2017-09-11 10:42:23 +0000
    
    
Note:

This library was originally written as [SwiftDateTimeExtensions](https://github.com/schluete/SwiftDateTimeExtensions) but it was too old for new Swift version and needed improvements.

I am also planning to add more features to this class in future thus created a separate repo instead a fork.
