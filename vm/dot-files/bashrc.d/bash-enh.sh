is_parameter(){
   parameter_flag="-"
   
   command=$1
   first=${command:0:1}
   
   if [ $first = $parameter_flag ]; then
      echo true
   else
      echo false
   fi
}

mv_keep_path (){
   # Split arguments and parameters
   arguments=()
   parameters=()
   for i in $@; do
      if  `is_parameter $i` ; then
         parameters+=($i)
      else
         arguments+=($i)
      fi
   done


   # Take the last argument as destination
   dest=${arguments[@]: -1}

   stop=`expr ${#arguments[@]} - 1`
   for source in ${arguments[@]:0:$stop}; do
      relative_path=`dirname $source`
      destination_path="$dest/$relative_path/"
      mkdir -p $destination_path
      mv $parameters $source $destination_path
   done
}

