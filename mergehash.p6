use MONKEY;
my %a;
my %b;
#%a<Z> = "orig";
#%b<Z> = "new";
%a<b> = 1;
%b<a> = 2;
%a<y><z> = 2;
%b<y><a> = 1;
%a.merge(%b).say;
say %b;
augment class Hash {
    method merge (%b) {
        hashmerge self, %b;
        self;
    }
    sub hashmerge (%merge-source, %merge-into) {
        for %merge-source.keys {
            if %merge-into{$_}:exists {
                hashmerge %merge-source{$_}, %merge-into{$_}; 
            }
            else {
                %merge-into{$_} = %merge-source{$_};
            }
        }
        %merge-into;
    }
}