#! /usr/bin/python3

def run(pylkc):
    while True:
        try:
            bus = input()
        except EOFError:
            break
        s = pylkc.sym_find(bus.upper())
        if s is None:
            continue
        s.set_tristate_value(pylkc.tristate.no)
