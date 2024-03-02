TotalSpace=$(systeminfo | grep 'Total Physical Memory' | awk '{ print $4 }' | tr -d ',')
AvailableSpace=$(systeminfo | grep 'Available Physical Memory' | awk '{ print $4 }' | tr -d ',')
UsedSpace=$((TotalSpace - AvailableSpace))


Percentt=$(((UsedSpace*100)/TotalSpace))
THRESHOLDD=70
if [[ $Percentt -gt $THRESHOLDD ]] then
   echo "ALERT !! Memory consumption has exceeded $THRESHOLDD% , Current Consumption : $Percentt%" >> file.log
else
   echo "Memory consumption is safe and within the threshold : $Percentt%" >> file.log
fi


