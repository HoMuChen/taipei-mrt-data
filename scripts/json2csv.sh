#!/bin/sh

FROM=$1
TO=$2

usage() {
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$FROM \$TO"
    echo ""
    exit
}

if [ -z $2 ]; then
    usage
fi

echo FROM: $FROM
echo TO: $TO

jq -r '[.station, .datetime, .inbound, .outbound] | @csv' $FROM > $TO
