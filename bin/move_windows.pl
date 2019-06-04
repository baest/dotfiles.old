#!/usr/bin/env perl

# Run from tmux like: run-shell move_windows.pl

use strict;
use warnings;
use 5.10.0;

my ($session, $cmd_session);

$session = (shift @ARGV) // qx(tmux display-message -p '#S');
chomp $session;
$cmd_session = "-t $session";

my @windows = qx(tmux list-windows $cmd_session);

my $max_number = $#windows;
for (0..($max_number-1)) {
    qx(tmux swap-window -s $session:$_ -t $session:$max_number);
}

system("tmux select-window $cmd_session:0");
