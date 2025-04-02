#/bin/ruby

bt_uid="AD:F9:62:A0:31:64"

system("rfkill block bluetooth && sleep 1 && rfkill unblock bluetooth && sleep 2 && bluetoothctl connect #{bt_uid}")


