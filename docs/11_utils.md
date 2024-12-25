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

