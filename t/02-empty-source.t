#! /usr/bin/env perl6

use v6.d;

use Test;

use Hash::Merge::Augment;

plan 1;

my %hash =
    a => "a",
    b => {
        c => "c"
    },
;

my %empty;

%empty.merge(%hash);

is-deeply %empty, %hash, "Merge into empty hash";
