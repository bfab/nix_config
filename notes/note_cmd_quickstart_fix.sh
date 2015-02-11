# execute from the folder that contains dist/

sed -i "s/\bsed -i '' -E /sed -i /"          dist/postgres/clean.sh
sed -i "s/\(\bsed .*\)(\..)/\1\\\\(.*\\\\)/" dist/postgres/clean.sh
