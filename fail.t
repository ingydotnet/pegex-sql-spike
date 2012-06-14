use strict;
use lib 'lib';
use Test::More tests => 1;
use SQL::Translator;
use Test::Differences;
use YAML;
use IO::All;
use XXX;

my $expect = io('expect')->all;

my $input = <<'...';
CREATE TABLE [Foo] (
   [id] int NOT NULL
);
...

my $translator = SQL::Translator->new();

$translator->translate( from => 'SQLServer', data => \$input ) or die $translator->error;

my $got = Dump $translator->schema->{tables};

eq_or_diff $got, $expect;
