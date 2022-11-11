# codingpackets-shazam

Find
https://stackoverflow.com/questions/28076954/regex-to-find-replace-beginning-and-end-of-string
```
<span class="emphasize-text-darkmode">(.*?)</span>
```

Replace
```
{{ text::emphasize(text="$1") }}
```

```
<a href="(.*?)">(.*?)</a>
```

Replace
```
{{ link::e(path="$1", description="$2") }}
```

```
nb.noteBlock(
```

Replace
```
text::note_block(text=
```

```
bi.boxedImage(
```

Replace
```
image::boxed(path=
```

```
cb.codeBlock
```

Replace
```
text::code_block
```

Find
```
<a href="(.*?)">(.*?)</a>
```

Replace
```
{{ link::e(path="$1", description="$2") }}
```

Find
```
<code>(.*?)</code>
```

Replace
```
{{ text::code(text="$1") }}
```

Find 
```
<span class="hljs-comment">(.*?)</span>
```

Replace
```
$1
```