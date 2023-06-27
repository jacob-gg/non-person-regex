**A regex pattern for identifying non-person names**  
[Jacob Goldstein-Greenwood](https://github.com/jacob-gg/)  
Last revised: 2023-06-27

This repository contains code to generate a regex pattern that flags non-person names based on common (English) strings that indicate that a name is likely a business, institution, organization, etc. The pattern is written for use in R, which uses double `\\` to escape metacharacters in regex patterns.

Load the `non_person_regex` object (a string) into R with:  

`source('https://raw.githubusercontent.com/jacob-gg/non-person-regex/main/non_person_regex.R')`

---

There's also a function in this repository called `get_business_names()` that takes a city/town name and a two-letter US state abbreviation as arguments and returns a vector of business names pulled from [this website](https://us-business.info/). The function is useful for identifying additional strings to add to the regex pattern:

```
source('https://raw.githubusercontent.com/jacob-gg/non-person-regex/main/get_business_names.R')
get_business_names(city = 'brunswick', state = 'ga')
get_business_names(city = 'ENDICOTT', state = 'WA')
```

---

Caveats:

- The regex pattern is only useful when dealing with English non-person names. "Groupe d'investissement de Paris" will not be matched (although "Investment Group of Paris" will). Spellings of relevant English strings that comprise the pattern are primarily American, but I've tried to include alternatives where possible (e.g., "center" and "centre").
- The regex pattern matches common strings that appear in non-person but not (or only rarely) person names. A non-person with a unique name, like a cafe called "Mothy," will not be matched (although "Cafe Mothy" will).
