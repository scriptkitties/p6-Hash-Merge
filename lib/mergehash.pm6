use MONKEY;
augment class Hash {
    method merge (%b) {
        hashmerge self, %b;
        self;
    }
    sub hashmerge (%merge-into, %merge-source) {
        for %merge-source.keys {
            if %merge-into{$_}:exists {
                hashmerge %merge-into{$_}, %merge-source{$_};
            }
            else {
                %merge-into{$_} = %merge-source{$_};
            }
        }
        %merge-into;
    }
}
