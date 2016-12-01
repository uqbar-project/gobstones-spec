# stones-spec
> Minimal, parser-agnostic, test framework for Gobstones

## Usage

```ruby
StonesSpec::Runner.new(gobstones_parser).run!(test_definition)
```

## Parser

That `gobstones_parser` must implement:
- `run(source_file, initial_board_file, final_board_file)`

The return value is something like `{ result, status }`.

Possible status values are:
  - `:passed`
  - `:failed`
  - `:runtime_error`
  - `:syntax_error`

## Development test in REPL

```bash
# change lib/version.rb and stones-spec.gemspec
export VERSION=1.0.0 # for example
rm stones-spec-$VERSION.gem
gem uninstall stones-spec
gem build stones-spec.gemspec
gem install stones-spec-$VERSION.gem
irb -rstones-spec
```