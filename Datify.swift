// Originaly Written By:
// timeDateExtensions.swift [https://github.com/schluete/SwiftDateTimeExtensions]
// Created by Axel Schlueter on 4.6.14.
//
// The MIT License (MIT)
// Copyright (c) 2014 Axel Schlueter

// Renamed to Datify [https://github.com/hemangshah/Datify]
// Updated for Swift 3.x on 6th.Jun.17.
// Hemang Shah
// The MIT License (MIT)
// Copyright (c) 2017 Hemang Shah

import Foundation

extension NSDateComponents {
  /** returns the current date plus the receiver's interval */
  var fromNow: Date {
    let cal = NSCalendar.current
    return cal.date(byAdding: (self as DateComponents) as DateComponents, to: Date.init() as Date)!
  }
  
  /** returns the current date minus the receiver's interval */
  var ago: Date {
    let cal = NSCalendar.current
    return cal.date(byAdding: -self as DateComponents, to: Date.init())!
  }
}

/** helper method to DRY the code a little, adds or subtracts two sets of date components */
func combineComponents(left: NSDateComponents,
  right: NSDateComponents,
  multiplier: Int) -> NSDateComponents
{
  let comps = NSDateComponents()
  comps.second = ((left.second != NSDateComponentUndefined ? left.second : 0) +
                  (right.second != NSDateComponentUndefined ? right.second : 0) * multiplier)
  comps.minute = ((left.minute != NSDateComponentUndefined ? left.minute : 0) +
                  (right.minute != NSDateComponentUndefined ? right.minute : 0) * multiplier)
  comps.hour = ((left.hour != NSDateComponentUndefined ? left.hour : 0) +
                (right.hour != NSDateComponentUndefined ? right.hour : 0) * multiplier)
  comps.day = ((left.day != NSDateComponentUndefined ? left.day : 0) +
               (right.day != NSDateComponentUndefined ? right.day : 0) * multiplier)
  comps.month = ((left.month != NSDateComponentUndefined ? left.month : 0) +
                 (right.month != NSDateComponentUndefined ? right.month : 0) * multiplier)
  comps.year = ((left.year != NSDateComponentUndefined ? left.year : 0) +
                (right.year != NSDateComponentUndefined ? right.year : 0) * multiplier)
  return comps
}

/** adds the two sets of date components */
func +(left: NSDateComponents, right: NSDateComponents) -> NSDateComponents {
  return combineComponents(left: left, right: right, multiplier: 1)
}

/** subtracts the two sets of date components */
func -(left: NSDateComponents, right: NSDateComponents) -> NSDateComponents {
  return combineComponents(left: left, right: right, multiplier: -1)
}

/** negates the two sets of date components */
prefix func -(comps: NSDateComponents) -> NSDateComponents {
  let result = NSDateComponents()
  if(comps.second != NSDateComponentUndefined) { result.second = -comps.second }
  if(comps.minute != NSDateComponentUndefined) { result.minute = -comps.minute }
  if(comps.hour != NSDateComponentUndefined) { result.hour = -comps.hour }
  if(comps.day != NSDateComponentUndefined) { result.day = -comps.day }
  if(comps.month != NSDateComponentUndefined) { result.month = -comps.month }
  if(comps.year != NSDateComponentUndefined) { result.year = -comps.year }
  return result
}

/** functions to convert integers into various time intervals */
extension Int {
  var minutes: NSDateComponents {
    let comps = NSDateComponents()
    comps.minute = self;
    return comps
  }
  
  var hours: NSDateComponents {
    let comps = NSDateComponents()
    comps.hour = self;
    return comps
  }
  
  var days: NSDateComponents {
    let comps = NSDateComponents()
    comps.day = self;
    return comps
  }
  
  var weeks: NSDateComponents {
    let comps = NSDateComponents()
    comps.day = 7 * self;
    return comps
  }
  
  var months: NSDateComponents {
    let comps = NSDateComponents()
    comps.month = self;
    return comps
  }
  
  var years: NSDateComponents {
    let comps = NSDateComponents()
    comps.year = self;
    return comps
  }
}

//Mark: Usage Example
func testDatify() -> Void {
  print("now:                   \(Date.init())")
  print("8 days later:          \(8.days.fromNow)")
  print("2 weeks before:        \(2.weeks.ago)")
  print("5 days, 3 month later: \((5.days + 3.months).fromNow)")
}
