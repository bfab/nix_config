#! /bin/bash
 
if [ $# -eq 0 ] ; then
   echo "USAGE: $(basename $0) file1 file2 file3 ..."
   exit 1
fi
 
for file in $* ; do
   html=$(echo $file | sed 's/\.txt$/\.html/i')
 
   echo "<html>" > $html
#   echo "   <title>foo</title>" >> $html   
   echo "   <body>" >> $html
   echo "      <pre><code>" >> $html
 
   cat $file >> $html
 
   echo "      </code></pre>" >> $html
   echo "   </body>" >> $html
   echo "</html>" >> $html
done