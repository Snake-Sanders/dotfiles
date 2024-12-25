# SSH 

put your private and pullic keys in `~/.shh/`

Typically you want the permissions to be:

| Item        | Sample              | Numeric | Bitwise      |
|-------------|---------------------|---------|--------------|
| SSH folder  | `~/.ssh`            | `700`   | `drwx------` |
| Public key  | `~/.ssh/id_rsa.pub` | `644`   | `-rw-r--r--` |
| Private key | `~/.ssh/id_rsa`     | `600`   | `-rw-------` |
| Home folder | `~`                 | `755` at most | `drwxr-xr-x` at most |
