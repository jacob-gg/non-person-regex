Miscellany and notes for non-person-regex

---

Below are some patterns that are plausible regex components but that I've omitted because, in tests so far, they appear in person names frequently enough to introduce meaningful detection error:

- Barber: last names (barbers and barbershops? are retained in regex)
- Butcher: last names (butchers is retained in regex)
- Church: last names (churches is retained in regex)
- Council: last names (councils is retained in regex)
- Groves?: last names
- Height: last names (heights is retained in regex)
- House: last names (houses is retained in regex)
- St(reet)?: last names and parts of last names (St Clare)
- Tyre: first names and last names (tires? is retained in regex)
- Water: last names

In testing, non-person names containing these strings tend to get flagged via other patterns in the regex

---

Currently, the following business identifiers are flagged (all case-insensitive):

- CO, CO., COMPANY
- CO-OP, COOP, CO-OPERATIVE, COOPERATIVE
- CORP, CORP., CORPORATION
- D/B/A, D.B.A., DBA
- INC, INC., INCORPORATED
- LTD, LTD., LIMITED
- LLC, LC (with optional periods throughout, and optionally proceeded by P or R, e.g., PLLC)
- LP, LLP, LLLP (with optional periods throughout, and optionally proceeded by P or R, e.g., RLLLP)
- PC, PA, PBC (with optional periods throughout)

List put together based on: https://en.wikipedia.org/wiki/List_of_legal_entity_types_by_country#United_States

---

Potential updates

- Match anything that doesn't have a space in it (i.e., single-word names, which are almost surely businesses)
