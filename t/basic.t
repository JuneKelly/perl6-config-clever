use v6;

BEGIN { @*INC.unshift('lib') };

use Test;
plan 2;

use Config::Clever;
ok 1, "'use Config::Clever' worked";

my $result = Config::Clever::load('production');
ok $result == 42, "load works";
