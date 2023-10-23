#!/usr/bin/env fish
# install a specific version of a homebrew formula
# usage: ./version.fish FORMULA VERSION
set formula $argv[1]
# fish has reserved var version
set vers $argv[2]

if test -z "$formula"; or test -z "$vers"
    echo "Invalid arguments \"$argv\" must pass a formula name and version number"
end

# core may not be tapped under new brew JSON APIs
brew tap homebrew/core
brew install $formula
and brew extract --version=$vers $formula phette23/local
and brew unlink $formula
and brew install --overwrite phette23/local/$formula@$vers # attempt install
and cd (brew --repository phette23/local)
and git add Formula && git commit -m "$FORMULA@$VERSION"
and echo "Formula installed and committed to local tap, git push to update the remore tap repo"
