#! /usr/bin/env false

use v6.c;
use MONKEY-TYPING;

use Hash::Merge;
use X::Hash::Merge::TypeObject;

# Don't use precompilation in order to not conflict with other MONKEY-TYPING
# modules.
no precompilation;

augment class Hash {
	method merge (
		Hash:D:

		#| The Hash to merge into this one.
		%hash,

		#| Boolean to set whether Associative objects should be merged on their
		#| own. When set to False, Associative objects in %second will
		#| overwrite those from %first.
		Bool:D :$deep = True,

		#| Boolean to set whether Positional objects should be appended. When
		#| set to False, Positional objects in %second will overwrite those
		#| from %first.
		Bool:D :$positional-append = True,
	) {
		self = merge-hash(self, %hash, :$deep, :$positional-append);
	}
}

# vim: ft=perl6 ts=4 sw=4 et
