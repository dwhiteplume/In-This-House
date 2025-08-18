#!/usr/bin/env perl
use strict;
use warnings;
use Getopt::Long;

# Default values
my $message   = 'Your message';
my $doormat   = '';
my $maxLength = 300;

# Parse command-line options
GetOptions(
    'message=s'   => \$message,
    'doormat=s'   => \$doormat,
    'maxLength=i' => \$maxLength,
) or die "Error in command line arguments\n";

# ASCII frames
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

# Handle doormat centering
if ($doormat ne '') {
    my $houseWidth = 13;
    my $doormatWidth = length($doormat);
    my $halfMat = int($doormatWidth / 2);

    if ($doormatWidth < $houseWidth) {
        my $padding = int($houseWidth / 2) - $halfMat;
        $doormat = (' ' x $padding) . $doormat;
    }
}

# Construct meme
my $meme = "$top\n$message\n$bottom";
$meme .= "\n$doormat" if $doormat ne '';

# Validate length
if (length($meme) <= $maxLength) {
    print "$meme";
} else {
    die length($meme) . " -gt $maxLength\n";
}
