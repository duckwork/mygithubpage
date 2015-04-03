#!/bin/bash

outFile="$1";
header="$2";
shift 2;
glob="$@";

echo -n "Compiling ${outFile}";
cat "$header" > $outFile;

for file in $glob; do
    # Copy title to $outFile & link
    title="$(grep '^title:' "$file" | cut -d' ' -f2- | sed 's/"//g')";
    if (( $RANDOM % 13 == 0 )); then
        echo -n "| " >> "$outFile";
    else
        echo -n "  " >> "$outFile";
    fi
    echo "[$title](${file%.*}.html)" >> "$outFile";
    echo -n ".";
done
echo "Done.";