# Install utility packages


## Imagemagick

To edit images programatically

brew install imagemagick

## Chromedriver

to test with Waffle or selenium

brew info chromedriver

then remove it from quarentine

1. Open terminal
2. Navigate to path where your chromedriver file is located
3. Execute any one of the below commands

Command1: 

`xattr -d com.apple.quarantine <name-of-executable>`

Example

/usr/local/Caskroom/chromedriver 
$ xattr -d com.apple.quarantine chromedriver

**Updated for latest MacOs version** 

To install run:

`brew install --cask chromedriver`

To update run: 

`brew upgrade chromedriver`

run the tests, it will fail because Apple cannot verify the source,
the popup message will offer the option to open the file location.
Open it and then open a terminal in that location, then execute this
commad to remove chromedriver from the quarentine:

`xattr -d com.apple.quarantine chromedriver`

For MacOs _Sonoma_ the command is different

`Example:

```
cd /opt/homebrew/Caskroom/chromedriver/129.0.6668.58/chromedriver-mac-arm64
xattr -c chromedriver
```
