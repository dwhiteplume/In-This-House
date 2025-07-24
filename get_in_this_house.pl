#!/usr/bin/env perl
use strict;
use warnings;
use Getopt::Long;

# Default parameters
my $message    = 'MESSAGE';
my $max_length = 300;

# Parse command-line options
GetOptions(
    'message|m=s'    => \$message,
    'max-length|l=i' => \$max_length,
) or die "Usage: $0 --message <text> --max-length <number>\n";

# ASCII art frames
my $top = <<'TOP';
┏┓
┃┃╱╲in
┃╱╱╲╲this
╱╱╭╮╲╲house
▔▏┗┛▕▔ we
╱▔▔▔▔▔▔▔▔▔▔╲
TOP

my $bottom = <<'BOTTOM';
╱╱┏┳┓╭╮┏┳┓ ╲╲
▔▏┗┻┛┃┃┗┻┛▕▔
BOTTOM

# Assemble the meme
my $meme = join "\n", $top, $message, $bottom;

# Measure total character count (including newlines)
my $length = length($meme);

# Output or error based on length check
if ($length <= $max_length) {
    print "$meme\n";
    exit 0;
} else {
    warn "Error: $length -gt $max_length\n";
    exit 1;
}
