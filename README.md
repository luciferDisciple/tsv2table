# tsv2table

Command line utility for pretty printing tsv files (tab separated values).

```
$ tsv2table --help
usage: tsv2table [-h] [-V] [TSV_FILE...]

Output data from tab separated values file (.tsv) as ASCII table. First line is
assumed to be the header, a row with column labels.

positional arguments:
  TSV_FILE      Path to the tab separated values file. With no TSV_FILE, read
                stdin.

optional arguments:
  -h, --help     display this help and exit
  -V, --version  output version information and exit
$
```
```
$ tsv2table movies.header.tsv movies.tsv
Year of Release  Title                        Directors
---------------  -----                        ---------
1984             Terminator                   James Cameron
1986             Top Gun                      Tony Scott
1991             Addam's Family               Barry Sonnenfeld
1991             Robin Hood                   John Irvin
1991             Terminator 2: Judgement Day  James Cameron
1993             Addam's Family Values        Barry Sonnenfeld
1995             Welcome to the dollhouse     Todd Solondz
1998             Big Lebowski                 Ethan Coen;Joel Coen
1999             Matilda                      Danny DeVito
2001             The man that wasn't there    Ethan Coen;Joel Coen
2003             Kill Bill                    Quentin Tarantino
2004             Kill Bill vol. 2             Quentin Tarantino
2005             Earthlings                   Shaun Monson
2010             Insidious                    James Wan
2013             We're the Millers            Rawson Marshall Thurber
2014             American Sniper              Clint Eastwood
2014             Relatos salvajes             Damián Szifrón
2019             Gi-saeng-chung               Joon-ho Bong
2021             Nobody                       Ilya Naishuller
$
```
