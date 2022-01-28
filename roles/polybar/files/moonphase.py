#!/usr/bin/env python
"""
moonphase.py - Calculate Lunar Phase
Author: Sean B. Palmer, inamidst.com
Cf. http://en.wikipedia.org/wiki/Lunar_phase#Lunar_phase_calculation
"""

import math, decimal, datetime
dec = decimal.Decimal

def position(now=None): 
   if now is None: 
      now = datetime.datetime.now()

   diff = now - datetime.datetime(2001, 1, 1)
   days = dec(diff.days) + (dec(diff.seconds) / dec(86400))
   lunations = dec("0.20439731") + (days * dec("0.03386319269"))

   return lunations % dec(1)

def phase(pos): 
   index = (pos * dec(8)) + dec("0.5")
   index = math.floor(index)
   return {
      0: "<i>New Moon</i> ", 
      1: "<i>Waxing Crescent</i> ", 
      2: "<i>First Quarter</i> ", 
      3: "<i>Waxing Gibbous</i> ", 
      4: "<i>Full Moon</i> ", 
      5: "<i>Waning Gibbous</i> ", 
      6: "<i>Third Quarter</i> ", 
      7: "<i>Waning Crescent</i> "
   }[int(index) & 7]

def main(): 
   pos = position()
   phasename = phase(pos)

   # roundedpos = round(float(pos), 3)
   print("%s" % (phasename))

if __name__=="__main__": 
   main()
