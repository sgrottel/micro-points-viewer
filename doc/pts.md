# PTS Point Cloud File Format

The PTS point cloud file format is a very simple text-based file format.
It is very easy to write and parse, especially compared to harder standardized formats, like LAS.

It is inefficient for large data, due to it's text-file nature.
This is not an issue for this application, as this is only meant as rendering demonstrator.
Medium sized data sets (10-100 million of points) are sufficiently large.

It is an industry standard and widely supported by many software, like [CloudCompare](https://www.cloudcompare.org/).
There is no hard specification of the file format.
This document is the basis of the implementation used in this application.
There are fewer variants in the field, compared to alternative formats, like XYZ.


## Encoding

The text files only contain very vew possible characters:
`0-1 . -` `\s` _space_, `\n` _new line_, (`\r` _carriage return_)
Any other characters should be ignored.

The input file can be assumed to be 7-bit ascii (or 7-bit range of UTF-8).
No file BOM should be present.

For new line definitions, `\n` and `\r` are valid, as well as their combination.
The use of single `\n` for line breaks (Unix standard) is recommended.
Empty lines should just be skipped.


## Parsing Element

The whole file is expected to only contain numbers:

`UInt` -- unsigned integer numbers are a sequence of digits: `[0-9]+`

`Int` -- signed integer numbers are a sequence of digits, optionally preceded by a minus sign: `-?[0-9]+`

`Float` -- a floating point number is a sequence of digits (zero digits allowed), optionally preceded by a minus sign, optionally split by one dot, followed by a second sequence of digits: `-?[0-9]*(?:\.[0-9]+)?`

(Scientific notation of float numbers is not supported.)

Files are parsed based on lines, terminated by line breaks: `\n` or `\r`.
Leading spaces `\s` are skipped.
Encountering any unexpected character will result in the rest of the line being skipped.

(It is not recommended to include unsupported characters.)


## File Structure

The first non-empty line contains one `UInt` specifying the total number of points expected in the file.

After this every non-empty line is expected to define one point.
For this, each line specifies `3`, `4`, `6` or `7` elements.

The first three elements are expected to be `Float` and specify the `x y z` positions of the points.

All axes form a right-hand coordinate system.
Positive `z` axis is considered upwards.

If the line specifies `4` or `7` elements, the `4`th element is a `Int` specifying a gray scale laser intensity value.
This value is expected to be in the range of `[-2048..2047]` where a higher values represents a stronger intensity.

If the line specifies `6` or `7` elements, the last three elements are `UInt` and specify a `r g b` color information.
Those values are expected to be in the range of `[0..255]` where a higher values represents a brighter color.


## References

This definition is based on the information from the following web resources:

* http://paulbourke.net/dataformats/pts/
* http://justsolve.archiveteam.org/wiki/Leica_Cyclone
* https://sites.google.com/site/matterformscanner/learning-references/ptx-format
* https://www.cs.unc.edu/~isenburg/pointzip/
* https://www.cloudcompare.org/


## Example

PTS files can look like this:

```
807949
-0.053833 0.265564 0.103424 -309 48 19 5
-0.174194 0.306519 0.097565 -203 72 46 21
-0.399567 0.003235 0.099274 -484 63 37 31
-0.399384 0.002197 0.099030 -439 62 36 30
-0.399902 0.004303 0.097778 -455 63 38 31
[...]
```

