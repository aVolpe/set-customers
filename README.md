# set-people
Downloads and join the data of RUC's from the SET and create a simple JSON.

# Usage

```bash
bundle install
ruby full.rb
cat result.txt
```

# Explanation

This script downloads all the RUC's from the [SET
webpage](http://www.set.gov.py/portal/PARAGUAY-SET/InformesPeriodicos?folder-id=repository:collaboration:/sites/PARAGUAY-SET/categories/SET/Informes%20Periodicos/listado-de-ruc-con-sus-equivalencias),
and joins it in a giant csv.

The CSV (it's a file separated by `|`) can be used as datasource for programs
like a ETL to feed a database.

Check [the verification digit
generator](https://gist.github.com/aVolpe/fffbe6a9e9858c7e3546fb1d55782152) to
generate the verification digits of any RUC.
