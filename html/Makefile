index.html: index_template.html publications.html tools.html talks.html teaching_experience.html
	xmllint $< --xinclude --output $@ --noent

%.html: ../../xslt/%_html.xsl ../data.xml
	xsltproc $^ > $@

clean:
	$(RM) publications.html tools.html talks.html teaching_experience.html index.html
.PHONY: clean
