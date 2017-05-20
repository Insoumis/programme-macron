#for s in 16 32 180 192 256; do
#  inkscape public/elements/logo.svg -w ${s} -h ${s} -e "public/elements/logo-${s}x${s}.png";
#done

for f in public/elements/c*.svg; do
  name=`echo $f | sed -e 's/\.[^.]*$//'`
  inkscape $f -w 560 -h 300 -e "$name.png";
done

saxonb-xslt -s:liste.xml -xsl:laec.xsl -o:"laec" -ext:on
python laec.py

for f in templates/*.xsl; do
    bn=$(basename "$f")
    bn_noext="${bn%.*}"
    saxonb-xslt -s:liste.xml -xsl:$f -o:"public/${bn_noext}.html" -ext:on
done

