**A regex pattern for identifying non-person names**  
[Jacob Goldstein-Greenwood](https://github.com/jacob-gg/)  
Last revised: 2022-10-07

This repository contains code to generate a regex pattern that flags non-person names based on common (English) strings that indicate that a name is likely a business, institution, organization, etc. The pattern is written for use in R, which uses double `\\` to escape metacharacters.

Load the `non_person_regex` object (a string) into R with:  

`source('https://raw.githubusercontent.com/jacob-gg/non-person-regex/main/non_person_regex.R')`

This repository also includes a CSV of "test" names. Some are non-persons and should be flagged by the pattern; others are people whose names include "trick" strings that should be skipped by the pattern ("ijk**cafe**xyz," ijk**auto**xyz," etc.). Load the test data set into R with:

`read.csv('https://raw.githubusercontent.com/jacob-gg/non-person-regex/main/non_person_regex_test_names.csv')`

Check the pattern's performance with:

```
source('https://raw.githubusercontent.com/jacob-gg/non-person-regex/main/non_person_regex.R')
non_person_regex_check <- function(print_unmatched = T) {
  test_dat <- read.csv('https://raw.githubusercontent.com/jacob-gg/non-person-regex/main/non_person_regex_test_names.csv')
  matched <- grepl(x = test_dat$name, pattern = non_person_regex)
  cat('Pattern identifies', paste0(sum(matched), '/', sum(test_dat$type == 'non-person')), 'non-person names',
      '\nPattern skips', paste0(sum(matched == F), '/', sum(test_dat$type == 'person')), "person names\n")
  if (print_unmatched) {cat('Unmatched:', paste0(test_dat$name[!matched], collapse = ', '), '\n')}
}
non_person_regex_check(print_unmatched = F)
```

Caveats:

- The regex pattern is only useful when dealing with English non-person names. "Groupe d'investissement de Paris" will not be matched (although "Investment Group of Paris" will). Spellings of relevant English strings that comprise the pattern are primarily American, but I've tried to include alternatives where possible (e.g., "center" and "centre").
- The regex pattern matches common strings that appear in non-person but not (or only rarely) person names. A non-person with a unique name, like a cafe called "Mothy," will not be matched (although "Cafe Mothy" will).