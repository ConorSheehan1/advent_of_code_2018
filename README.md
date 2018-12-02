Ruby solutions for [advent of code 2018](https://adventofcode.com/2018)
and a thor script for generating scripts to solve aoc problems.

## Usage

The aoc script uses thor so it contains help output itself.  
just run ./aoc to see how to use it

```
./aoc g test_day                # generate a new script and spec file
./aoc spec test_day             # run the spec
./aoc to_sc test_day            # run the script on the actual input, send the output to the screen
./aoc to_f test_day test_input  # run the script on custom input, send the output to a file
```

## Project

```
# tests
bundle exec rspec

# linter
bundle exec rubocop

# docs
bundle exec yard
```
