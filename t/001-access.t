use strict;
use warnings;
use Test::More;
use WWW::httpBL;

if ( !$ENV{'HTTPBL_ACCESS_KEY'} ) {
  plan skip_all => 'Need HTTPBL_ACCESS_KEY in %ENV to continue!';
  exit;
}

plan tests => 3;

my $h = WWW::httpBL->new( { access_key => $ENV{'HTTPBL_ACCESS_KEY'},
                                 debug => 1 } );

ok( $h->isa('WWW::httpBL'), ' new() returns the right thing' );  
is( $h->access_key(), $ENV{'HTTPBL_ACCESS_KEY'}, ' access key set' );

# now set access key to something else and try again
$h->access_key('abcdef123456');
is ($h->access_key(), 'abcdef123456', ' get/set access key' );
