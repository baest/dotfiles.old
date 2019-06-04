#!/usr/bin/env perl

# Run from tmux like: run-shell "move_window_pushdown_others.pl 3"
use strict;
use warnings;
use 5.10.0;

my ($session, $cmd_session);

$session = qx(tmux display-message -p '#S');
chomp $session;
$cmd_session = "-t $session";

my $window_insert_at = (shift @ARGV) // '';

die "Incorrect insert at pos: $window_insert_at" if $window_insert_at eq '' || $window_insert_at < 0;

my @windows = qx(tmux list-windows $cmd_session);
my ($active_win, $max_window);

foreach (@windows) {
    my $current_window;

    if (/^(\d+):/) {
        $max_window = $current_window = $1;
    }

    if (/\(active\)$/) {
        $active_win = $current_window;
    }
}

die "Incorrect insert at pos $window_insert_at is larger than max window: $max_window" if $max_window < $window_insert_at;

my $src_window = $max_window;
while ($src_window > $window_insert_at) {
    my $target_window = $src_window-1;
    qx(tmux swap-window $cmd_session -s $session:$src_window -t $session:$target_window);
    $src_window--;
}

system("tmux select-window -t $session:$window_insert_at");
