#! /usr/bin/env false

use v6.d;

unit module Hash::Merge;

#| Merge any number of Hashes together.
sub merge-hashes (
	#| Any number of Hashes to merge together.
	*@hashes,

	--> Hash
) is export {
	my %result = @hashes.shift;

	# Nothing to do if we only got 1 argument
	return %result unless @hashes.elems;

	for ^@hashes.elems {
		%result = merge-hash(%result, @hashes.shift);
	}

	%result;
}

#| Merge two hashes together.
sub merge-hash (
	#| The original Hash to merge the second Hash into.
	%first,

	#| The second hash, which will be merged into the first Hash.
	%second,

	#| Boolean to set whether Associative objects should be merged on their
	#| own. When set to False, Associative objects in %second will
	#| overwrite those from %first.
	Bool:D :$deep = True,

	#| Boolean to set whether Positional objects should be appended. When
	#| set to False, Positional objects in %second will overwrite those
	#| from %first.
	Bool:D :$positional-append = True,

	--> Hash
) is export {
	my %result = %first;

	for %second.keys -> $key {
		# If the key doesn't exist yet in %first, it can be inserted without worry.
		if (%first{$key}:!exists) {
			%result{$key} = %second{$key};
			next;
		}

		given (%first{$key}) {
			# Associative objects need to be merged deeply.
			when Associative {
				%result{$key} = $deep
					?? merge-hash(%first{$key}, %second{$key}, :$deep, :$positional-append)
					!! %second{$key}
			}
			# Positional objects can be merged or overwritten depending on $append-array.
			when Positional {
				%result{$key} = $positional-append
					?? (|%first{$key}, |%second{$key})
					!! %second{$key}
			}
			# Anything else will just overwrite.
			default {
				%result{$key} = %second{$key};
			}
		}
	}

	%result;
}

# vim: ft=raku ts=4 sw=4 et
