#!/bin/bash

# init raw and reform file
echo -n > raw_delays
echo -n > reformatted_delays

for file in ./logfiles/*; do
   grep -o ".*delay: [0-9]\.[0-9]*e-[0-9]* " $file > temp
   if [[ `cat temp` == "" ]]; then
      echo "no match in $file"
   else
      cat temp >> raw_delays
      # get matching string from matching line
      match=`sed -e "s/.*\( [0-9]\.[0-9]*e-[0-9]* \).*\( [0-9]\.[0-9]*e-[0-9]*\)/\1 \2/g" temp`
      echo "$file $match" >> reformatted_delays
   fi
done

# replace filepath with file name
sed -e "s/\.\/logfiles\/\(.*\)\.log\.txt/\1/g" reformatted_delays > extracted_delays
echo "Matched: " `wc -l raw_delays | grep -o "[0-9]*"` "lines"

rm temp

# # get instances on separate lines
# grep -o "delay: [0-9]\.[0-9]*e-[0-9]*" alu4.log.txt > temp2
# # extract numbers
# sed "s/.*\([0-9]\.[0-9]*e-[0-9]*\)/\1/g" temp2
# # get em together
# grep -o ".*delay: [0-9]\.[0-9]*e-[0-9]* " alu4.log.txt > temp
# # reformat to spec
# sed "s/.*\( [0-9]\.[0-9]*e-[0-9]* \).*\( [0-9]\.[0-9]*e-[0-9]* \)/alu4\ \1\ \2/g" temp