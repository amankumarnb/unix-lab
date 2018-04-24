total=0
    echo "Enter number of process:"
    read n 
    echo "Enter Burst Time:"
    for(( i=0; $i<$n; i++ ))
    do
        
        read bt[$i]                 
    done
 
    #sorting burst time in ascending order using selection sort
    for ((i=0;$i<$n;i++))
do
        pos=$i;
        for(( j=$i+1; $j<$n; j++ ))
        do
            if [ ${bt[$j]} -lt ${bt[$pos]} ]
then
                pos=j;
   fi
done
 
        temp=${bt[$i]};
        bt[$i]=${bt[$pos]}
        bt[$pos]=$temp;
 
        temp=${p[$i]};
        p[$i]=${p[$pos]};
        p[$pos]=$temp;
    done
 
    wt[0]=0;            #waiting time for first process will be zero
 
    #calculate waiting time
    for ((i=1;i<n;i++))
    do
        wt[$i]=0
        for (( j=0; $j<$i; j++ ))
do
            wt[$i]=`expr ${wt[$i]} + ${bt[j]} | bc `;
 done
        total=`expr $total + ${wt[$i]}`;
    done
 
    avg_wt=`expr $total/$n`;      #average waiting time
    total=0;
 
    printf "\n Process\t     Burst Time\t\t  Waiting Time\t\t  Turnaround Time" 
    for ((i=0;i<n;i++))
    do
        tat[$i]=`expr ${bt[$i]} + ${wt[$i]}`     #calculate turnaround time
        total=`expr $total+${tat[$i]}`
       printf "\n $i  \t \t \t ${bt[$i]} \t \t \t ${wt[$i]} \t \t \t ${tat[$i]}"
    done
 
    avg_tat=`expr $total/$n`     #average turnaround time
    printf "\n\nAverage Waiting Time=$avg_wt"
    printf "\nAverage Turnaround Time=$avg_tat"

