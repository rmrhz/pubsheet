# Crystal

## Snippets
```cr
# Parses ltsv format to hashmap
# --
# https://forum.crystal-lang.org/t/is-there-a-better-way-to-create-a-hash-from-a-colon-and-comma-delimited-string/484
string.split("\t").map(&.split(':', 2).map(&.to_s)).to_h
```
