# LogSender

  _                  _____                _           
 | |                / ____|              | |          
 | |     ___   __ _| (___   ___ _ __   __| | ___ _ __ 
 | |    / _ \ / _` |\___ \ / _ \ '_ \ / _` |/ _ \ '__|
 | |___| (_) | (_| |____) |  __/ | | | (_| |  __/ |   
 |______\___/ \__, |_____/ \___|_| |_|\__,_|\___|_|   
               __/ |                                  
              |___/                                   

LogSender.sh is a bash script that will send randomized logs to the desired IP.
You can choose the port and the machine's IP that will receive the logs. Also you can decide to send them through UDP or TCP.


 ./LogSender [options] [protocol]

-------------------- OPTIONS --------------------------

-h, --h                show brief help
-a, --ip               The IP of the machine that will receive the logs.
-p, --port             The port to send the logs. By default is 514
-t, --time             The seconds interval between logs. If no time is specified, the logs will be sent as fast as possible

-------------------- PROTOCOLS --------------------------

--tcp                  The protocol to be used. Only supports tcp/udp. By default is TCP
--udp                  The protocol to be used. Only supports tcp/udp. By default is TCP
