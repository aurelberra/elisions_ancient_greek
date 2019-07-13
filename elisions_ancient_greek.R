library(tidyverse)

elisions <- read_lines("elisions_athenaeus.txt")
elisions <- elisions %>% tibble(word = .) %>% count(word) %>% arrange(desc(n))
# Elisions: 1264 (including 8 "deleted" words in square brackets, 1 unique)
elisions %>% count()
elisions %>% select(word) %>% unlist() %>% write_lines("output/temp.txt")
# Elisions occuring 10 times or more
elisions %>% filter(n > 9) %>% count()
elisions %>% filter(n > 9) %>% select(word) %>% unlist() %>% write_lines("output/temp.txt")
# Elisions occuring 5-9 times
elisions %>% filter(n > 4 & n < 10) %>% count()
elisions %>% filter(n > 4 & n < 10) %>% select(word) %>% unlist() %>% write_lines("output/temp.txt")
# Elisions occuring 2-4 times
elisions %>% filter(n > 1 & n < 5) %>% count()
elisions %>% filter(n > 1 & n < 5) %>% select(word) %>% unlist() %>% write_lines("output/temp.txt")
# Elisions occuring 1 time
elisions %>% filter(n == 1) %>% select(word) %>% unlist() %>% write_lines("output/temp.txt")
