## follow the steps to generate the full contextual labels ##

1) convert the normal text into festival prompts format
       python ./src/text2prompt.py example/example.txt example/example.data 

2) generate the festival prompts into utts file
       $FESTVOXDIR/src/promptselect/text2utts -all -level Text -odir example/utts -otype utts -itype data example/example.data

3) generate the utts into full-contextual and mono label files
       sh ./src/generate_labels.sh example/labels example/utts $FESTDIR/festival/examples/dumpfeats src/
 
 Where $FESTVOXDIR and $FESTDIR are enviornment variables. They provides the path for festvox and festival tools.
