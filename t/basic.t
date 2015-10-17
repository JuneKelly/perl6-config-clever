use v6;

BEGIN { @*INC.unshift('lib') };

use Test;
plan 5;

use Config::Clever;
ok 1, "'use Config::Clever' worked";

my $result;

$result = Config::Clever::load();
ok $result == %(one => 1, two => 2), "load works";

$result = Config::Clever::load(:environment('production'));
ok $result == %(
    one => 1,
    two => 22,
    three => %(four => 4),
    five => 5
    ), "production load works";

# test hash-merge
$result = Config::Clever::hash-merge( %(), %(one => 1) );
ok $result == %(one => 1), "hash merge works on simple value";

$result = Config::Clever::hash-merge(
    %(one => 0,
      two => %(three => 0),
      four => 4),
    %(one => 1,
      two => %(three => [3, 33]))
);
ok $result == %(one => 1,
                two => %(three => [3, 33]),
                four => 4), "hash merge works on more complex value";
