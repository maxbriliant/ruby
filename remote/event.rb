#!/usr/bin/env ruby
require 'joystick'
require 'tuples'

###get tuples or value/pair list to run

js0 = Joystick::Device.new('/dev/input/js0')
ev = js0.event("nonblocking")

btns = Array.new
#SNES Controller
BTN_X = 0
BTN_A = 1
BTN_B = 2
BTN_Y = 3
BTN_L = 4
BTN_R = 5
BTN_START  = 8
BTN_SELECT = 9
AXIS_MIN_X = Tuple(0, -32767)
AXIS_X = Tuple(0, 32767)
AXIS_MIN_Y = Tuple(1,  32767)
AXIS_Y = Tuple(1, -32767)

btnArray = [BTN_X, BTN_A, BTN_B, BTN_Y, BTN_L, BTN_R, "", "", BTN_START, BTN_SELECT, AXIS_MIN_X, AXIS_X, AXIS_MIN_Y, AXIS_Y]

for btn in js0.buttons
  btns.push btn
end

def whichBtn(event)

  case event.number

  when event.number <= 9 && event.number >= 0
    return btnArray[event.number]

  when event.number == 32767
    if event.value == 0
      return btnArray[11]
    end
    if event.value == 1
      return btnArray[12]
    end

  when even.number == -32767
    if event.value == 0
      return btnArray[10]
    end
    if event.value == 1
      return btnArray[13]
    end

  end

end


def isButton(event)
  return event.type.to_s.contains("button")
end

def isAxis(event)
  return event.type.to_s.contains("axis")
end

def numButton(event, js)
  return event
end
