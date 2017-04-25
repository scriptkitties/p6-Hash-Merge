#! /usr/bin/env perl6

use v6.c;
use lib 'lib';
use Test;

plan 2;

use Hash::Merge;

my Hash $hash = {
    a => "a",
    b => {
        c => "c"
    }
};

my Hash $empty = {};

$empty.merge($hash);

is-deeply $empty, $hash, "Merge into empty hash";

my Hash $nil;

$nil.merge($hash);

is-deeply $nil, $hash, "Merge into uninitialized hash";
