# Rainbow Bash
This bash script overrides clear, so when you call clear in shell, it displays the date, moving back and forth, and padded with less and greater than symbols. The reason was just to have some fun and learn more about writing shell scripts.  

![rainbow bash gif](https://lh6.googleusercontent.com/ZaxIVjFIpg_ooj5ePm4vM5Ovrg4xB2ZFiqTApEL3FkhtIbFtTEMSfH8ZoXiFn6rX5nAmmolyOtY=w2512-h1170)
## Installation
Copy the script to your home directory, and add an entry in your `~/.bashrc`.
```shell
curl https://raw.githubusercontent.com/DrewBro-Designs/bash_fun/master/rainbow_bash.sh > ~/.rainbow_bash.sh && echo ". ~/.rainbow_bash.sh" >> ~/.bashrc
```
## Usage
Make sure to source your bash bashrc `source ~/.bashrc`, and checkout the rainbow magic when you run `clear`.
