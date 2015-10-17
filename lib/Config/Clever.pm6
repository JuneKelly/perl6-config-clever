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
            for %data.kv -> $k, $v {
                %config{$k} = $v;
            }
        }
    }

    return %config;
}
