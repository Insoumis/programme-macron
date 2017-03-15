for f in templates/*.xsl; do
    bn=$(basename "$f")
    bn_noext="${bn%.*}"
    saxonb-xslt -s:liste.xml -xsl:$f -o:"public/${bn_noext}.html" -ext:on
done


