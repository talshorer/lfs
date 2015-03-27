#! /usr/bin/python3

import sys
import os
import collections


def main(pylkc, rule_func, output):
    lfs = os.environ["LFS"]
    conffile = os.path.join(lfs, "linux-config")
    if output is None:
        output = conffile
    linux = os.path.join(lfs, "linux")
    pylkc.init(linux)
    pylkc.conf_parse(linux)
    pylkc.conf_read(conffile)
    rule_func(pylkc)
    pylkc.conf_write(output)


def _main():
    import argparse
    p = argparse.ArgumentParser()
    rule_type = collections.namedtuple("Rule", ["file", "func"])
    p.add_argument("--rule", type=(lambda s: rule_type(*s.split(":"))))
    p.add_argument("--pylkc")
    p.add_argument("-o", dest="output")
    args = p.parse_args()
    # allow path to start with "~/"
    sys.path.append(os.path.expanduser(args.pylkc))
    import pylkc
    rule_func = getattr(__import__(args.rule.file), args.rule.func)
    main(pylkc, rule_func, args.output)

if __name__ == "__main__":
    _main()
