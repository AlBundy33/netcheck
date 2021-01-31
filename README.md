# netcheck
Script to check an log if internet is available

Install in crontab on a device running 24/7 (in my case a raspberry pi).

```
crontab -e
```

and add this entry to check connection every minute

```
* * * * * /home/pi/netcheck/netcheck.sh
```

Connction losses and reconnctions will be logged to netcheck.log (will be created in same folder as netchck.sh).
