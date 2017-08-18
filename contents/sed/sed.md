# Sed

Sed is a text manipulation program often used for text substitution in existing files.

## Escape syntax

Characters should be escaped when they are to be used literally instead of being interpreted functionally.

### Sed

Sed's escape charachter is the: `\` (backslash) character. Which specific characters must be escaped differs between Sed's 'search pattern' and 'replacement text' parts:

- _Search pattern:_ Regular expression control characters:

	```
	$.*/[\]^
	```

- _Replacement text:_ Sed's 'repeat match-pattern', 'escape character', and 'delimiter' characters must be escaped:

	```
	&\/
	```

	> NOTE: When a custom delimiter (other than the default `/` slash) is used than _that_ character should be escaped instead!

### Shell (both sed parts)

- Single quote characters must be escaped. The following specific string must be used to enter a literal `'` (single quote character):

	```
	'\''
	```

	> NOTE: The 'shell' escape example depicts the _complete_ string to escape a single `'` (single quote character), whereas the Sed specific examples above only state the characters that have to be escaped (with a backslash).

## Operation

### Append / prepend lines

- Append a line _after_ a pattern:

	```
	sed -i '/<pattern>/a \
		<line1>\
		<line2>' <inputfile>
	```

- Prepend the lines _before_ a pattern:

	```
	sed -i '/<pattern>/i \
		<line1>\
		<line2>' <inputfile>
	```

	> `-i` - replace In-place
	> `pattern` - string to search / match
	> `line1` and `line2` - text to append / prepend
	> `inputfile` - original file


## References

> Adapted from: Unix & Linux (StackExchange)
[What characters do I need to escape when using sed in a sh script?][4]

> Adapted from: Scripting (StackOverflow)
[Using sed, Insert a line below (or above) the pattern?][3]

<!-- REFERENCES -->

[1]:assets/insert-lines-before-search-pattern.pdf
[2]:assets/escape-characters.pdf
[3]:https://stackoverflow.com/questions/11694980/using-sed-insert-a-line-below-or-above-the-pattern
[4]:https://unix.stackexchange.com/questions/32907/what-characters-do-i-need-to-escape-when-using-sed-in-a-sh-script


<!-- NGREP ONELINERS

>>> Sed escape characters - search-pattern:   $.*/[\]^
>>> Sed escape characters - replacement-text: &\/
>>> Sed escape characters - add single quote: '\''

-->
