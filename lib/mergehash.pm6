use MONKEY;
augment class Hash {
    method merge (%b) {
        hashmerge self, %b;
    }
    sub hashmerge (%merge-into, %merge-source) {
        for %merge-source.keys -> $key {
            if %merge-into{$key}:exists {
                if %merge-source{$key} ~~ Hash {
                    hashmerge %merge-into{$key}, %merge-source{$key};
                }
                elsif %merge-source{$key} ~~ Positional {
                    my @a;
                    for %merge-into{$key}.list {
                        @a.push: $_;
                    }
                    for %merge-source{$key}.list {
                        @a.push: $_;
                    }
                    %merge-into{$key} = @a;
                }
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
