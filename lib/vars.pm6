use v6.*;

module vars:ver<0.0.5>:auth<cpan:ELIZABETH> { }

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

=begin pod

=head1 NAME

Raku port of Perl's 'vars' pragma

=head1 SYNOPSIS

    use vars <$frob @mung %seen>;

=head1 DESCRIPTION

This module tries to mimic the behaviour of Perl's C<vars> pragma
as closely as possible in the Raku Programming Language.

This will predeclare all the subroutine whose names are in the list,
allowing you to use them without parentheses even before they're declared.

Unlike pragmas that affect the $^H hints variable, the "use vars" declarations
are not BLOCK-scoped. They are thus effective for the entire package in which
they appear. You may not rescind such declarations with "no vars".

See "Pragmatic Modules" in perlmodlib and "strict vars" in strict.

=head1 PORTING CAVEATS

Due to the nature of the export mechanism in raku, it is impossible (at the
moment of this writing: 2018.05) to export to the OUR:: stash from a module.
Therefore the raku version of this module exports to the B<lexical> scope
in which the C<use> command occurs.  For most standard uses, this is equivalent
to the Perl behaviour.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/vars . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018-2020 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
