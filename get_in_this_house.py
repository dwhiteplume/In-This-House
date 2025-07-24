#!/usr/bin/env python3
"""
get_in_this_house.py

Generates a stylized ASCII-art meme framing a custom message in an "In this house, we…" format.
Checks the total character length (including frames and message) against a user-defined maximum.
Exits with an error if the rendered meme exceeds that limit.
"""

import argparse
import sys

def main():
    parser = argparse.ArgumentParser(
        description="Frame a custom message in a playful ASCII-art house meme."
    )
    parser.add_argument(
        "-m", "--message",
        default="MESSAGE",
        help="Custom message to display between the ASCII frames (default: 'MESSAGE')"
    )
    parser.add_argument(
        "-l", "--max-length",
        type=int,
        default=300,
        dest="max_length",
        help="Maximum allowed character count for the full meme (default: 300)"
    )
    args = parser.parse_args()

    top = """\
┏┓
┃┃╱╲in
┃╱╱╲╲this
╱╱╭╮╲╲house
▔▏┗┛▕▔ we
╱▔▔▔▔▔▔▔▔▔▔╲"""

    bottom = """\
╱╱┏┳┓╭╮┏┳┓ ╲╲
▔▏┗┻┛┃┃┗┻┛▕▔"""

    # Assemble the meme
    meme = f"{top}\n{args.message}\n{bottom}"

    # Count characters (includes newlines)
    length = len(meme)

    if length <= args.max_length:
        print(meme)
    else:
        print(f"Error: {length} -gt {args.max_length}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
