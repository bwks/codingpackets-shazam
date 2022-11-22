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

Code Blocks
```
<div class="code-block-caption-darkmode text-center">
\s+<span class="code-block-title-darkmode">(.*?)</span>
\s+
\s+</div>
\s+<div class="code-block-left-darkmode">
\s+<pre><code class="(.*?) hljs">
(.*?(.|[\n])*?)
\s+</code>
\s+</pre>
\s+</div>
```

```
{{ text::code_block(
  header="$1",
  language="$2",
  code=`$3`
) }}

```


```
<div class="code-block-caption-darkmode text-center">
\s*<span class="code-block-title-darkmode">(.*?)</span>
\s*
\s*</div>
\s*<div class="code-block-left-darkmode">
\s*<pre><code class="(.*?) hljs">
(.*?(.|[\n])*?)
\s*</code>
\s*</pre>
\s*</div>
```


```
  <h3>
    (.*)
  </h3>
```

```
  <h3>$1</h3>
```