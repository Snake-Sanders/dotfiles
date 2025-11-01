# MacOS

## Show hidden files

Open finder and press `CMD + Shift + .`

## Stop auto start

How to Stop MacBook Auto-Boot on Lid Open [M1/M2/M3]

    sudo nvram AutoBoot=%00

## Enable keyboard navigation

go to:

 System Settings > Accessibility > Keyboard

and toggle: `Full keyboard access`

## Enable fast scrolling on VSCode Nvim plug

The 3rd command worked, but maybe the first 2 are needed.

```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
sudo defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool false
```
