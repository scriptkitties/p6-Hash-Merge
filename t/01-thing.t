#!/usr/bin/env perl6
use v6;
use lib 'lib';
use mergehash;
use Test;
my %a;
my %b;
#%a<Z> = "orig";
#%b<Z> = "new";
%a<b> = 1;
%b<a> = 2;
%a<y><z> = 2;
%b<y><a> = 1;
my %b-orig = %b;
my %a-orig = %a;
%a.merge(%b);
is-deeply %b, %b-orig;
is-deeply %a, {:a(2), :b(1), :y(${:a(1), :z(2)})};
