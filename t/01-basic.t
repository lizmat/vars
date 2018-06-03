use v6.c;
use Test;

BEGIN my @vars = <$frob @mung %seen>;
BEGIN plan 2 * @vars;

use vars @vars;

BEGIN ok ::{$_}:exists, "did we get an export for $_ at BEGIN" for @vars;

ok $frob.VAR ~~ Scalar, 'is $frob a scalar container';
ok @mung     ~~ Array,  'is @mung an Array';
ok %seen     ~~ Hash,   'is %seen a Hash';

# vim: ft=perl6 expandtab sw=4
