# netcheck
Script to check and log if internet connection is available.

Install in crontab on a device running 24/7 (in my case a raspberry pi).

Edit your crontab with
```
crontab -e
```
and add this entry to check your internet connection every minute
```
* * * * * /home/pi/netcheck/netcheck.sh
```

Connection losses and reconnections will be logged to netcheck.log (will be created in same folder as netcheck.sh).
