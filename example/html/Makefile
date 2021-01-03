index.html: index_template.html publications.html tools.html talks.html
	xmllint $< --xinclude --output $@ --noent

%.html: ../../xslt/%_html.xsl ../data.xml
	xsltproc $^ > $@
