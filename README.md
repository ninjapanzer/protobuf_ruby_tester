# protobuf_ruby_tester

As I would through some patterns with Protobuf and ruby I will be dropping those items in here.

## This project uses
ASDF
buf-cli
ruby

## How do I run it
- `bundle`
- `buf generate`
- `ruby main.rb` || `bundle exec ruby main.rb`

## Features
### Nested JSON
There is a case where we might have a repeated field in a proto that has a varying type. We don't wanna just a one_of because changes or inclusions in types is a breaking action.

Since the nested field is JSON we can capture it as a dynamic struct object so we can validate it and pass it forward.

`two_step_nested_json.rb` -> includes an example where we have a decoupled pair of nested messages and how we can ingest the whole object and identify and distribute it to a varried set of messages.
