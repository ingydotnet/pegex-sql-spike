use strict;
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

my $got = Dump $translator->translate( from => 'SQLServer', data => \$input )->{tables};

eq_or_diff $got, $expect;
