use v6;

BEGIN { @*INC.unshift('lib') };

use Test;
plan 3;

use Config::Clever;
ok 1, "'use Config::Clever' worked";

my $result;

$result = Config::Clever::load();
ok $result == %(one => 1, two => 2), "load works";

$result = Config::Clever::load(:environment('production'));
ok $result == %(one => 1, two => 22), "production load works";
