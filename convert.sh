FILENAME="codingpackets/templates/blog/cloud-notes-aws-s3.jinja";

sed -i -e 's/<\/span>/<\/span>\r\n/g' $FILENAME

sed -i -e 's/cb\.codeBlock/text::code_block/g' $FILENAME

sed -i -e 's/nb\.noteBlock(/text::note_block(text=/g' $FILENAME

sed -i -e 's/nb\.importantBlock(/text::important_block(text=/g' $FILENAME

sed -i -e 's/nb\.warningBlock(/text::warning_block(text=/g' $FILENAME

sed -i -e 's/bi\.boxedImage(/image::boxed(path=/g' $FILENAME

sed -i -r -e 's/<span class="hljs-comment">(.*?)<\/span>/\1/g' $FILENAME

# Internal Links
sed -i -e 's/{{ links.rootPath.uri }}/\//g' $FILENAME
sed -i -e 's/{{ links.blogPath.uri }}/\/blog/g' $FILENAME
sed -i -r -e 's/<a href="\/blog\/(.*?)">(.*?)<\/a>/{{ link::i(path="\/blog\/\1", description="\2") }}/g' $FILENAME

# Exteranal Links
sed -i -e 's/link.href(/link::e(/g' $FILENAME

sed -i -r -e 's/<a href="(.*?)">(.*?)<\/a>/{{ link::e(path="\1", description="\2") }}/g' $FILENAME

sed -i -r -e 's/<a href="(.*?)">(.*?)<\/a>/{{ link::e(path="\1", description="\2") }}/g' $FILENAME

sed -i -r -e 's/<code>(.*?)<\/code>/{{ text::code(text="\1") }}/g' $FILENAME

sed -i -r -e 's/<span class="emphasize-text-darkmode">(.*?)<\/span>/{{ text::emphasize(text="\1") }}/g' $FILENAME

sed -i -r -e 's/\{\% verbatim \%\}(.*?)\{\% endverbatim \%\}/\1/g' $FILENAME

# Convert external to internal links
sed -i -e 's/{{ link::e(path="\/"/{{ link::i(path="\/"/g' $FILENAME
sed -i -e 's/{{ link::e(path="\/blog"/{{ link::i(path="\/blog"/g' $FILENAME
