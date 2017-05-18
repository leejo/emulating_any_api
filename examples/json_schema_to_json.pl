#!perl

use strict;
use warnings;
use feature qw/ say /;

use JSON::Schema::ToJSON;
use JSON;

my $data = JSON::Schema::ToJSON->new
    ->json_schema_to_json( schema_str => <<'EndOfSchema'
{
    "title": "Person",
    "type": "object",
    "properties": {
        "firstName": { "type": "string" },
        "lastName": { "type": "string" },
        "age": {
            "description": "Age in years",
            "type": "integer",
            "minimum": 0,
            "maximum": 117
        }
    },
    "required": ["firstName", "lastName"]
}
EndOfSchema
   	);

say encode_json( $data );
