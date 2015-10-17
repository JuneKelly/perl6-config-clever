use v6;
use JSON::Tiny;
unit module Config::Clever;

our &load is export = sub (:$environment = "default", :$config-dir = "./config") {
    my %config;
    my @paths = (
        "$config-dir/default.json",
        "$config-dir/$environment.json"
    );
    for @paths -> $path {
        if "$path".IO ~~ :e {
            my $content = $path.IO.slurp;
            my %data = from-json($content);
            hash-merge(%config, %data);
        }
    }

    return %config;
}

our &hash-merge is export = sub (%one, %two) {
    sub walk (%left, %right) {
        for %right.kv -> $k, $v {
            if $v ~~ Hash {
                walk(%left{$k}, $v);
            } else {
                %left{$k} = $v;
            }
        }
    }
    walk(%one, %two);
    %one;
}
