use strict;
use lib 'lib';
use Test::More tests => 1;
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

#use SQL::Translator;
#my $translator = SQL::Translator->new();
#
#$translator->translate( from => 'SQLServer', data => \$input ) or die $translator->error;
#
#my $got = Dump $translator->schema->{tables};

#$ENV{PERL_PEGEX_DEBUG} = 1;
use Pegex::Grammar;
use Pegex::Compiler;
my $grammar = io('grammar')->all;
my $pegex_grammar = Pegex::Grammar->new(
    tree => Pegex::Compiler->compile($grammar)->tree,
    receiver => 'MyAST',
);
#$YAML::DumpCode = 1;
#XXX $pegex_grammar->can('parse');
my $got = Dump $pegex_grammar->parse($input);

eq_or_diff $got, $expect;
