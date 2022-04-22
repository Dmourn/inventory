#!/bin/bash


touch file{1..3}
touch .hidden{1,2,3}
BASE_CASE=$(find ./ | sort)
test() {
  set -e
  take file1
  take file*
  take .hidden*

  drop file*
  drop .hidden2 file2
  drop file{1,3}
  drop .hidden{1,3} 
}

test || echo -e "\e[39m FAILURE\e[0m" 

NEW_CASE=$(find ./ | sort)

printf "The test was a:"
if [[ "$NEW_CASE" = "$BASE_CASE" ]]; then
  printf "\e[92m SUCCESS\e[0m\n" 
else
  printf "\e[91m FAILURE\e[0m\n" 
fi

if [ "$NEW_CASE" = "$BASE_CASE" ] && [ "$NEW_CASE" != "$BASE_CASE" ]; then
  printf "The test should fail:\e[91m Success\e[0m\n" 
else
  printf "This test should fail:\e[92m FAILURE\e[0m\n" 
fi

# printf "1:${BASE_CASE}\n2:${NEW_CASE}"
# vim: ts=2 sw=2 expandtab
