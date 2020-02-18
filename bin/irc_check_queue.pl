use 5.020;
use Beanstalk::Client;
use String::ShellQuote;

my $client = Beanstalk::Client->new({});

while(1) {
    my $job = $client->reserve;
    my %data = $job->args;

    last if system(shell_quote('terminal-notifier',
        '-message', $data{message},
        '-title', $data{channel}));

    $job->delete;
}

say 'done';
