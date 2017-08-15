# Sed

Sed is a text manipulation program often used for text substitution in existing files.

## Escaping syntax

Characters should be escaped when they are to be used literally instead of being interpreted functionally.

### Sed

Sed's escape charachter is the: `\` (backslash) character.

Which specific characters must be escaped differs between Sed's 'search pattern' and 'replacement text' parts:

- _Search pattern:_ Regular expression control characters must be escaped if to be used literally:

	```
	$.*/[\]^
	```

- _Replacement text:_ Sed's 'repeat match-pattern', 'escape character', and 'delimiter' characters must be escaped if to be used literally:

	```
	&\/
	```

	> NOTE: When a custom delimiter (other than the default `/` slash) is used than _that_ character should be escaped instead!

### Shell (both sed parts)

- Single quote characters must be escaped using the following specific string:

	```
	'\''
	```

	> NOTE: The 'shell' escape example depicts the _complete_ string to escape a single `'` (single quote character), whereas the Sed specific examples above only state the characters that have to be escaped (with a backslash).

## Operation

### Append / prepend lines

- Append a line _after_ the pattern:

	```
	sed -i '/<pattern>/a \
		<line1>\
		<line2>' <inputfile>
	```

- Prepend the lines _before_ the pattern:

	```
	sed -i '/<pattern>/i \
		<line1>\
		<line2>' <inputfile>
	```

	> `-i` - Inplace replacement.
	> `pattern` - string to search  (match) for.
	> `line1` and `line2` - text to append or prepend.
	> `inputfile` - the original file that requires changing.


## References

> Adapted from:
> Unix & Linux - StackExchange ([snapshot][2]):
> [What characters do I need to escape when using sed in a sh script?][4]

> Adapted from:
> Scripting - StackOverflow ([snapshot][1]):
[Using sed, Insert a line below (or above) the pattern?][3]

<!-- REFERENCES -->

[1]:assets/insert-lines-before-search-pattern.pdf
[2]:assets/escape-characters.pdf
[3]:https://stackoverflow.com/questions/11694980/using-sed-insert-a-line-below-or-above-the-pattern
[4]:https://unix.stackexchange.com/questions/32907/what-characters-do-i-need-to-escape-when-using-sed-in-a-sh-script
