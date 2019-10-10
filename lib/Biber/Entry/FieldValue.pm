package Biber::Entry::FieldValue;
use v5.24;
use strict;
use warnings;

use Biber::Annotation;
use Biber::Config;
use Log::Log4perl qw( :no_extra_logdie_message );
use List::Util qw( first );
no autovivification;
my $logger = Log::Log4perl::get_logger('main');


=encoding utf-8

=head1 NAME

Biber::Entry::FieldValue

=head2 new

    Initialise a Biber::Entry::FieldValue object

=cut

sub new {
  my ($class, $value, $form, $lang) = @_;
  my $this = bless {}, $class;
  if (defined($value)) {
    $this->set_value($value, $form, $lang);
  }
  return $this;
}

=head2 get_value

  Retrieve a field value for a particular form/lang

=cut

sub get_value {
  my ($self, $form, $lang) = @_;
  $form = $form // 'default';
  $lang = $lang // Biber::Config->getoption('mslang');
  return $self->{$form}{$lang};
}

=head2 set_value

  Set a field value for a particular form/lang

=cut

sub set_value {
  my ($self, $value, $form, $lang) = @_;
  $form = $form // 'default';
  $lang = $lang // Biber::Config->getoption('mslang');
  $self->{$form}{$lang} = $value;
  return;
}

1;

__END__

=head1 AUTHORS

Philip Kime C<< <philip at kime.org.uk> >>

=head1 BUGS

Please report any bugs or feature requests on our Github tracker at
L<https://github.com/plk/biber/issues>.

=head1 COPYRIGHT & LICENSE

Copyright 2009-2012 François Charette and Philip Kime, all rights reserved.
Copyright 2012-2019 Philip Kime, all rights reserved.

This module is free software.  You can redistribute it and/or
modify it under the terms of the Artistic License 2.0.

This program is distributed in the hope that it will be useful,
but without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=cut
