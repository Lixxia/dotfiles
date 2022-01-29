#!/usr/bin/env python3

from yahoo_fin import stock_info as si
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("ticker")
args = parser.parse_args()

try:
    r = si.get_live_price(args.ticker)
except DeprecationWarning as e:
    pass
print(str(round(r,3)))
