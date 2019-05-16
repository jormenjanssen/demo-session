i="0"
UBUNTUVERSION="`cat /etc/*release | grep VERSION_ID | sed 's/"//g' | sed 's/VERSION_ID=*//'`"
while [ $i -lt 1 ]
do
echo "Hello World! running on a ${UBUNTUVERSION} Ubuntu container with kernel `uname -r` with a little bit help from: ${ENGINEER}"
sleep 3
done