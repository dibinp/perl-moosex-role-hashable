package MooseX::Role::Hashable;

=head1 NAME

MooseX::Role::Hashable - transform the object into a hash

=cut

use strict;
use warnings;

use Moose::Role;
use namespace::autoclean;

=head1 VERSION

Version 0.01

=cut

our $VERSION = '1.00';

=head1 SYNOPSIS

This module adds a single

Example usage:

	package Foo;
	use Moose;
	use MooseX::Role::Hashable;

	has field1 => (is => 'rw');
	has field2 => (is => 'ro');
	has field3 => (is => 'bare');

	__PACKAGE__->meta->make_immutable;

	package main;

	my $foo = Foo->new(field1 => 'val1', field2 => 'val2', field3 => 'val3');
	$foo->as_hash;
	# => {field1 => 'val1', field2 => 'val2', field3 => 'val3'}

=cut

=head1 METHODS

=cut

=head2 as_hash

Transform the object into a hash of attribute-value pairs.  All attributes,
including those without a reader, are extracted.  If a value is a reference,
as_hash will perform a shallow copy.

=cut

sub as_hash {
	my $self = shift;
	return +{
		map { ($_->name => $_->get_value($self)) }
		$self->meta->get_all_attributes
	};
}

=head1 ACKNOWLEDGEMENTS

This module is brought to you by L<Shutterstock|http://www.shutterstock.com/>
(L<@ShutterTech|https://twitter.com/ShutterTech>).  Additional open source
projects from Shutterstock can be found at
L<code.shutterstock.com|http://code.shutterstock.com/>.

=head1 AUTHOR

Aaron Cohen, C<< <aarondcohen at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-MooseX-Role-Hashable at rt.cpan.org>, or through
the web interface at L<https://github.com/aarondcohen/MooseX-Role-Hashable/issues>.  I will
be notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooseX::Role::Hashable

You can also look for information at:

=over 4

=item * Official GitHub Repo

L<https://github.com/aarondcohen/MooseX-Role-Hashable>

=item * GitHub's Issue Tracker (report bugs here)

L<https://github.com/aarondcohen/MooseX-Role-Hashable/issues>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-Role-Hashable>

=item * Official CPAN Page

L<http://search.cpan.org/dist/MooseX-Role-Hashable/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Aaron Cohen.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of MooseX::Role::Hashable