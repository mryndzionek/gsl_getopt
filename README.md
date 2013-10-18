Introduction
------------

After reading [GSL](https://github.com/imatix/gsl) I decided to try learning the key concepts and grasp the idea behind this approach to code generation. This is the result of my research: **getopt C command-line parser generator**.
You just simply write an XML specification of the parser and the GSL script generates .c and .h file implementing the getopt based parser code. In case of parsers where the code connected implementing one option is scattered throughout the code base this approach is a clear win. You end up with short specification and a lot of code generated. The example specification is very simple - about 40 lines of code - and the generated code has about 500 lines of code.

Usage
-----
Got to the model directory and run the generate script:

```sh
cd model
./generate
```

The C source and header files will be created in *src\* and *include\* directories.
To add your own parser specification create an XML file in the model directory and modify the generate script. Look at the file *model/example_parser.xml* for example parser specification.

The GSL tool
------------

First I had the impression that the tool is too simple to handle all the required XML file transformations but luckily I was wrong. GSL if carefully designed to provide the minimum constructs allowing practically any task you can imagine. It is designed "the Linux way" - compact and orthogonal. In other words it stays true to "the KISS principle". The .gls files contain two intertwined 'flows' of code - the GSL code and the 'target' language code. For readability it is better to keep them indented separately. Also the [Vim coloring for GSL](http://www.vim.org/scripts/script.php?script_id=1605) helps a lot to visually switch between the two flows. Learning the concepts and writing this generator took me about five hours. If you need more examples please look at [FileMQ project](https://github.com/zeromq/filemq). It has generators for protocol parsers and state machines in C and Java. I would also recommend the [Peter Hintjens](http://hintjens.com/) blog and his books including the [ZeroMQ guide](http://zguide.zeromq.org/page:all).

TODO
----

- add support for 'long only' options
- add support for the main program arguments
- the regexand enum types are required - add 'default' option
