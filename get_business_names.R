##################################################
# Function for pulling business names for a city #
# Jacob Goldstein-Greenwood                      #
# GitHub: jacob-gg                               #
# Last revised: 2022-10-14                       #
##################################################

get_business_names <- function(city = 'charlottesville', state = 'va', remove_comma_names = TRUE) {
  stopifnot('state must be two characters' = is.character(state) & length(unlist(strsplit(x = state, split = ''))) == 2)
  
  pg <- 1
  business_names <- c()
  prev_pg_nms <- NA
  
  while (TRUE) {
    html <- rvest::read_html(paste0('https://us-business.info/directory/', tolower(city), '-', tolower(state), '/part', pg))
    new_nms <- html |> rvest::html_elements(css = '.org') |> rvest::html_text()
    
    if (pg > 1) {
      if ((prev_pg_nms[1] == new_nms[1]) & (prev_pg_nms[length(prev_pg_nms)] == new_nms[length(new_nms)])) {
        business_names <- business_names[duplicated(business_names) == F]
        if (remove_comma_names) {business_names <- business_names[grepl(x = business_names, pattern = '\\,') == F]}
        return(business_names)
      }
    }
    
    business_names <- append(business_names, new_nms)
    cat('\rGathered page', pg)
    pg <- pg + 1
    prev_pg_nms <- new_nms
  }
}