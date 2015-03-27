#! /usr/bin/python3


def run(pylkc):
    for s in pylkc.all_symbols():
        if s.get_tristate_value() == pylkc.tristate.mod:
            s.set_tristate_value(pylkc.tristate.no)
