#!/bin/bash

# Extract monophone and fullcontext labels from utterance files
# following scripts must be in "$scripts": extra_feats.scm label.feats label-full.awk  label-mono.awk 

labels=$1      ## Put the newly made labels here.
utts=$2        ## Look for existing utterances here.
dumpfeats=$3   ## $FESTDIR/examples/dumpfeats
scripts=$4     # Following scirpts must be here: extra_feats.scm label.feats label-full.awk  label-mono.awk 

mkdir -p $labels/mono
mkdir -p $labels/full

for utt in $utts/*.utt; do \
	base=`basename $utt .utt`; \
	echo $base
	if [ -s $utt ]; then \
		$dumpfeats      -eval     $scripts/extra_feats.scm \
				-relation Segment \
				-feats    $scripts/label.feats \
				-output   $labels/tmp \
				$utt; \
	fi; \
	gawk -f $scripts/label-full.awk $labels/tmp > $labels/full/$base.lab; \
	gawk -f $scripts/label-mono.awk $labels/tmp > $labels/mono/$base.lab; \
done
rm -f tmp
