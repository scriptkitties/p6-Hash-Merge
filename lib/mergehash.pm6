use MONKEY;
augment class Hash {
    #| Merges a second hash into the hash the method is called on. Hash given as
    #| the argument is not modified.
    #| Traverses the full tree, replacing items in the original hash with the
    #| hash given in the argument. Does not replace positional elements by default,
    #| and instead appends the items from the supplied hash's array to the original
    #| hash's array. The object type of positionals is not retained and instead
    #| becomes an Array type.
    #| Use :no-append-array to replace arrays and positionals instead, which will
    #| also retain the original type and not convert to an Array
    #|
    method merge (%b; Bool:D :$no-append-array = False) {
        hashmerge self, %b, :$no-append-array;
    }
    sub hashmerge (%merge-into, %merge-source, Bool:D :$no-append-array) {
        for %merge-source.keys -> $key {
            if %merge-into{$key}:exists {
                if %merge-source{$key} ~~ Hash {
                    hashmerge %merge-into{$key}, %merge-source{$key}, :$no-append-array;
                }
                elsif %merge-source{$key} ~~ Positional {
                    if $no-append-array {
                        %merge-into{$key} = %merge-source{$key};
                    }
                    else {
                        my @a;
                        @a.push: $_ for %merge-into{$key}.list;
                        @a.push: $_ for %merge-source{$key}.list;
                        %merge-into{$key} = @a;
                    }
                }
                # Non-positionals, so strings or Bools or whatever
                else {
                    %merge-into{$key} = %merge-source{$key};
                }
            }
            else {
                %merge-into{$key} = %merge-source{$key};
            }
        }
        %merge-into;
    }
}
