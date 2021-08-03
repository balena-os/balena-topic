#!/bin/sh -e
for m in layers/meta-topic/conf/machine/t*.conf
do
	MACHINE=`basename $m .conf`
	sed "s/MACHINE/${MACHINE}/g" scripts/template.coffee > ${MACHINE}.coffee
done
