# Phette23 Local

Created via `brew tap-brew phette23/local` command.

These are all specific old versions of formulae I've needed for some reason, usually to overcome installation errors of other tools. They're not actively maintained.

## How do I install these formulae?

`brew install phette23/local/<formula>`

Or `brew tap phette23/local` and then `brew install <formula>`.

## Adding formula

I tried to make these a `./version.fish FORMULA VERSION` script but it may not work.

```sh
brew tap homebrew/core # core may not be tapped under new brew JSON APIs
brew install $FORMULA
brew extract --version=$VERSION $FORMULA phette23/local
brew rm $FORMULA
brew install --overwrite phette23/local/$FORMULA@$VERSION # attempt install
brew edit phette23/local/$FORMULA # if formula won't install & needs edits
cd (brew --repository phette23/local)
git add Formula && git commit -m "$FORMULA@$VERSION" && git push
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
