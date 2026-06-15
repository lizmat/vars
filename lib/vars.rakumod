use v6.*;

module vars:ver<0.0.7>:auth<zef:lizmat> { }

sub EXPORT(*@vars) {
    my %export;
    my @huh;
    for @vars -> $name {
        %export{$name} := $name.starts-with('$')
          ?? my $
          !! $name.starts-with('@')
            ?? []
            !! $name.starts-with('%')
              ?? %()
              !! @huh.push($name)
    }
    die "Don't know how to export: @huh[]" if @huh;

    %export
}

# vim: expandtab shiftwidth=4
