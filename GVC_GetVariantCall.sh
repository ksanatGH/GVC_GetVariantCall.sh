#!/bin/sh

Sampleid='$1'
psql -U reporting -h 10.4.170.26 -d ghdb -W << EOF
select * from snv_call where run_sample_id='$1' and call='1';
select * from indel_call where run_sample_id='$1' and call='1';
select * from cnv_call where run_sample_id='$1' and call='1';
select * from fusion_call where run_sample_id='$1' and call='1';
EOF


# need to hit enter when you see 'Password for user reporting:' How to hit enter in shell script? 
# Tried install sshpass and use "sshpass" -p Gu@rD@nt ssh reporting@GHDB << EOF- dont work -will continue trying -feedback?
# Password is not required because it already incorporated in argument?
# future improvement will be rewrite it into a more elegant way e.g replace snv_call, indel_call, cnv_call with wildcard or incorporate 
#+more positional argument