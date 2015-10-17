use v6;

BEGIN { @*INC.unshift('lib') };

use Test;
plan 2;

use Config::Clever;
ok 1, "'use Config::Clever' worked";

my $result = Config::Clever::load();
ok $result == %(one => 1, two => 2), "load works";
