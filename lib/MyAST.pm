package MyAST;
use strict;
use base 'Pegex::Receiver';
use XXX;

use SQL::Translator::Schema::Table;
sub got_statement {
    my ($self, $table) = @_;
    return {$table->name, $table};
}
sub got_create_table {
    my ($self, $args) = @_;
    my ($name, $stuff) = @$args;
    return SQL::Translator::Schema::Table->new(
        name => $name,
    );
}

1;
