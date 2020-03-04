#!/usr/bin/env perl

use 5.020;
use Beanstalk::Client;
use String::ShellQuote;

my $client = Beanstalk::Client->new({});

while(1) {
    my $job = $client->reserve;
    my %data = $job->args;

    #    last if (system(shell_quote('terminal-notifier',
    #        '-message', $data{message},
    #        '-title', $data{channel})));

    $data{message} =~ s/"/\\"/g;
    $data{channel} =~ s/"/\\"/g;
    last if system(shell_quote('osascript', '-e', qq!display notification "$data{message}" with title "$data{channel}"!));

    sleep 5;

    $job->delete;
}

say 'done';
