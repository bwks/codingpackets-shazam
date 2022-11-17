FILENAME="codingpackets/templates/blog/ci-cd-for-networking-part-1.jinja";

sed -i -e 's/<\/span>/<\/span>\r\n/g' $FILENAME

sed -i -e 's/<\/code>/<\/code>\r\n/g' $FILENAME

sed -i -e 's/<\/kbd>/<\/kbd>\r\n/g' $FILENAME

sed -i -e 's/cb\.codeBlock/text::code_block/g' $FILENAME

sed -i -e 's/nb\.noteBlock(/text::note_block(text=/g' $FILENAME

sed -i -e 's/nb\.importantBlock(/text::important_block(text=/g' $FILENAME

sed -i -e 's/nb\.warningBlock(/text::warning_block(text=/g' $FILENAME

sed -i -e 's/qt\.quoteBlock(/text::quote_block(/g' $FILENAME

sed -i -e 's/bi\.boxedImage(/image::boxed(path=/g' $FILENAME

sed -i -r -e 's/<span class="hljs-comment">(.*?)<\/span>/\1/g' $FILENAME


# /<div class="code-block-caption-darkmode text-center">[\r\n\s]+<span class="code-block-title-darkmode">(.*?)<\/span>[\r\n\s]+<\/div>[\r\n\s]+<div class="code-block-left-darkmode">[\r\n\s]+<pre><code class="text hljs">[\r\n\s]+([\S\s]+)<\/code>[\r\n\s]+<\/pre>[\r\n\s]+<\/div>/gm

sed -i -r -e 's/<div class="code-block-caption-darkmode text-center">[$[[:blank:]]]+<span class="code-block-title-darkmode">(.*?)<\/span>[$[[:blank:]]]+<\/div>[$[[:blank:]]]+<div class="code-block-left-darkmode">[$[[:blank:]]]+<pre><code class="text hljs">[$[[:blank:]]]+([.[[:blank:]]]+)<\/code>[$[[:blank:]]]+<\/pre>[$[[:blank:]]]+<\/div>/{{ text::code_block(\r\nheader="\1",\r\nlanguage="text",\r\ncode="\2"\r\n) }}/g' $FILENAME

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
sed -i -r -e "s/<span class='emphasize-text-darkmode'>(.*?)<\/span>/{{ text::emphasize(text=\"\1\") }}/g" $FILENAME

sed -i -r -e 's/<kbd class="kbd-darkmode">(.*?)<\/kbd>/{{ text::kbd(text="\1") }}/g' $FILENAME

sed -i -r -e 's/\{\% verbatim \%\}(.*?)\{\% endverbatim \%\}/\1/g' $FILENAME

# Convert external to internal links
sed -i -e 's/{{ link::e(path="\/"/{{ link::i(path="\/"/g' $FILENAME
sed -i -e 's/{{ link::e(path="\/blog"/{{ link::i(path="\/blog"/g' $FILENAME
