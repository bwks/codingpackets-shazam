#! /bin/bash



files="\
codingpackets/templates/blog/vagrant-from-the-start-to-the-beginning.jinja \
"

for FILENAME in $files; do
  echo $FILENAME
  sed -i -e 's/<\/span>/<\/span>\r\n/g' $FILENAME

  sed -i -e 's/<\/code>/<\/code>\r\n/g' $FILENAME

  sed -i -e 's/<\/kbd>/<\/kbd>\r\n/g' $FILENAME

  sed -i -e 's/<\/a>/<\/a>\r\n/g' $FILENAME

  sed -i -e 's/cb\.codeBlock/text::code_block/g' $FILENAME

  sed -i -e 's/nb\.noteBlock(/text::note_block(text=/g' $FILENAME

  sed -i -e 's/nb\.importantBlock(/text::important_block(text=/g' $FILENAME

  sed -i -e 's/nb\.warningBlock(/text::warning_block(text=/g' $FILENAME

  sed -i -e 's/nb\.tipBlock(/text::tip_block(text=/g' $FILENAME

  sed -i -e 's/qt\.quoteBlock(/text::quote_block(/g' $FILENAME

  sed -i -e 's/bi\.boxedImage(/image::boxed(path=/g' $FILENAME

  sed -i -e 's/libvirt-console-exit.njk/libvirt-console-exit.jinja/g' $FILENAME

  sed -i -e 's/ipaddress-nh/font-mono/g' $FILENAME

  sed -i -e 's/class="ipaddress"/class="font-mono"/g' $FILENAME

  sed -i -r -e 's/<span class="hljs-comment">(.*?)<\/span>/\1/g' $FILENAME
  sed -i -r -e 's/<span class=\\"hljs-comment\\">(.*?)<\/span>/\1/g' $FILENAME

  sed -i -r -e 's/<div class="code-block-caption-darkmode text-center">[$[[:blank:]]]+<span class="code-block-title-darkmode">(.*?)<\/span>[$[[:blank:]]]+<\/div>[$[[:blank:]]]+<div class="code-block-left-darkmode">[$[[:blank:]]]+<pre><code class="text hljs">[$[[:blank:]]]+([.[[:blank:]]]+)<\/code>[$[[:blank:]]]+<\/pre>[$[[:blank:]]]+<\/div>/{{ text::code_block(\r\nheader="\1",\r\nlanguage="text",\r\ncode="\2"\r\n) }}/g' $FILENAME

  # Internal Links
  sed -i -e 's/{{ links.rootPath.uri }}/\//g' $FILENAME
  sed -i -e 's/\"{{ links.rootPath.description }}\"/root_path_description/g' $FILENAME
  sed -i -e 's/{{ links.blogPath.uri }}/\/blog/g' $FILENAME
  sed -i -e 's/link::e(path="#references/link::i(path="#references/g' $FILENAME
  sed -i -r -e 's/link::i\(path="#references", description="\[(.*?)\]"\)/link::i\(path="#references-\1", description="[\1]"\)/g' $FILENAME

  sed -i -r -e 's/<a href="\/blog\/(.*?)">(.*?)<\/a>/{{ link::i(path="\/blog\/\1", description="\2") }}/g' $FILENAME

  # Exteranal Links
  sed -i -e 's/link.href(/link::e(/g' $FILENAME

  sed -i -r -e 's/<a href="(.*?)">(.*?)<\/a>/{{ link::e(path="\1", description="\2") }}/g' $FILENAME

  sed -i -r -e 's/<a href="(.*?)">(.*?)<\/a>/{{ link::e(path="\1", description="\2") }}/g' $FILENAME


  sed -i -r -e 's/<code>(.*?)<\/code>/{{ text::code(text="\1") }}/g' $FILENAME

  sed -i -r -e 's/<span class="emphasize-text-darkmode">(.*?)<\/span>/{{ text::emphasize(text="\1") }}/g' $FILENAME
  sed -i -r -e "s/<span class='emphasize-text-darkmode'>(.*?)<\/span>/{{ text::emphasize(text=\"\1\") }}/g" $FILENAME
  sed -i -r -e 's/<span class=\\"emphasize-text-darkmode\\">(.*?)<\/span>/{{ text::emphasize(text=\"\1\") }}/g' $FILENAME
  

  sed -i -r -e 's/<kbd class="kbd-darkmode">(.*?)<\/kbd>/{{ text::kbd(text="\1") }}/g' $FILENAME

  sed -i -r -e 's/\{\% verbatim \%\}(.*?)\{\% endverbatim \%\}/\1/g' $FILENAME

  # Convert external to internal links
  sed -i -e 's/{{ link::e(path="\/"/{{ link::i(path="\/"/g' $FILENAME
  sed -i -e 's/{{ link::e(path="\/blog"/{{ link::i(path="\/blog"/g' $FILENAME
  sed -i -e 's/target="_blank", description/, description/g' $FILENAME
done

