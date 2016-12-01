# stones-spec
> Minimal test framework for Gobstones

## Usage

`// TODO`

## Development test in REPL

```bash
# change lib/version.rb and stones-spec.gemspec
export VERSION=0.3.0 # for example
rm stones-spec-$VERSION.gem
gem uninstall stones-spec
gem build stones-spec.gemspec
gem install stones-spec-$VERSION.gem
irb -rstones-spec
```