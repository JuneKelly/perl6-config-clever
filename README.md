# Config::Clever

A clever, heirarchical config loader for perl6.

## Example

```perl6
use v6;
use Config::Clever;

my $config = Config::Clever::load(:environment('production'));
```
