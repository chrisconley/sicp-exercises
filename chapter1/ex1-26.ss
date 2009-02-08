; Explicity multipling expmod instead of calling square will cause it to run more slowly
; because because expmod will be called twice instead of once each iteration of expmod.
; This means that it will take something like 2^n times longer to run.