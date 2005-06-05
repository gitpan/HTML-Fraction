#!perl
use strict;
use warnings;
use Test::More tests => 6;
use_ok('HTML::Fraction');

my $f = HTML::Fraction->new;
isa_ok($f, 'HTML::Fraction');

is($f->tweak("Hi there"), "Hi there");
is($f->tweak("Half is 1/2"), "Half is &frac12;");
is($f->tweak("1/2 of 1/2 is 1/2"), "&frac12; of &frac12; is &frac12;");
is($f->tweak("1/5 of 1/5 is 1/25"), "&#8533; of &#8533; is 1/25");