#for s in 16 32 180 192 256; do
#  inkscape public/elements/logo.svg -w ${s} -h ${s} -e "public/elements/logo-${s}x${s}.png";
#done

#saxonb-xslt -s:liste.xml -xsl:laec.xsl -o:"laec" -ext:on

for f in templates/*.xsl; do
    bn=$(basename "$f")
    bn_noext="${bn%.*}"
    saxonb-xslt -s:liste.xml -xsl:$f -o:"public/${bn_noext}.html" -ext:on
done


