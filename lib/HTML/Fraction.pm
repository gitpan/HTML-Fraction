package HTML::Fraction;
use strict;
use warnings;
our $VERSION = "0.30";

my %map = (
  '1/4' => '&frac14;',
  '1/2' => '&frac12;',
  '3/4' => '&frac34;',
  '1/3' => '&#8531;',
  '2/3' => '&#8532;',
  '1/5' => '&#8533;',
  '2/5' => '&#8534;',
  '3/5' => '&#8535;',
  '4/5' => '&#8536;',
  '1/6' => '&#8537;',
  '5/6' => '&#8538;',
  '1/8' => '&#8539;',
  '3/8' => '&#8540;',
  '5/8' => '&#8541;',
  '7/8' => '&#8542;',
);

sub new {
  my $class = shift;

  my $self = {};
  bless $self, $class;
  return $self;
}

sub tweak {
  my ($self, $in) = @_;

	$in =~ s{(\d)+/(\d+)}{
	  if ($map{$&}) {
	    $map{$&};
	  } else {
	    $&;
	  }
	}eg;
  
  return $in;
}

1;

__END__

=head1 NAME

HTML::Fraction - Encode fractions as HTML entities

=head1 SYNOPSIS

  my $fraction = HTML::Fraction->new;
  print $fraction->tweak($html);
  
=head1 DESCRIPTION

The L<HTML::Fraction> encodes fractions as HTML entities. Some very
commond fractions have HTML entities (eg 1/2 is &frac12;). Additionally,
common vulgar fractions have Unicode characters (eg 1/5 is &#8533;). This
module takes a string and encodes fractions as entities: this means that
it will look pretty in the browser.

Fractions that are supported: 1/4, 1/2, 3/4, 1/3, 2/3, 1/5, 2/5, 3/5,
4/5, 1/6, 5/6, 1/8, 3/8, 5/8 and 7/8.

=head1 CONSTRUCTOR

=head2 new

The constructor takes no arguments:

  my $fraction = HTML::Fraction->new;

=head1 METHODS

=head2 tweak

Encode the fractions in the HTML as HTML entities:

  print $fraction->tweak($html);

=head1 AUTHOR

Leon Brocard, C<< <acme@astray.com> >>

=head1 COPYRIGHT

Copyright (C) 2005, Leon Brocard

This module is free software; you can redistribute it or modify it
under the same terms as Perl itself.