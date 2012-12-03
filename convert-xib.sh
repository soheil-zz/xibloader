#!/bin/sh

# Where compiled nib files are (xib files get compiled into nib files on build)
RESOURCES_FOLDER="$SRCROOT/$PROJECT_NAME/"
BUILD_FOLDER="$TARGET_BUILD_DIR/$PROJECT_NAME.app/"

# The name of the source template, minus extension
SOURCE_NAME="XIBLoader"

# Create C arrays, representing each nib
tmp="$TEMP_FILES_DIR/compile-nib-$$.tmp"
cd "$BUILD_FOLDER"
for nib in *.nib; do
  xxd -i "$nib" >> $tmp.1
done

# Read the code template
TEMPLATE=`sed -n '/{%LOAD_TEMPLATE%}/,/{%LOAD_TEMPLATE END%}/ p' "$RESOURCES_FOLDER/$SOURCE_NAME.m" | sed '1 d;$ d'`

# Create loader code for each nib
for nib in *.nib; do
  ORIGINAL_FILENAME="$nib"
  ORIGINAL_FILENAME_WITH_NO_EXTENSION=`echo "$ORIGINAL_FILENAME" | sed 's/.nib$//'`
  SANITISED_FILENAME=`echo "$ORIGINAL_FILENAME" | sed 's/[^a-zA-Z0-9]/_/g'`
  SANITISED_FILENAME=`echo "$SANITISED_FILENAME" | sed 's/\([0-9]\)/__\1/'`
  echo "$TEMPLATE" | sed "s/ORIGINAL_FILENAME_WITH_NO_EXTENSION/$ORIGINAL_FILENAME_WITH_NO_EXTENSION/g;s/ORIGINAL_FILENAME/$ORIGINAL_FILENAME/g;s/SANITISED_FILENAME/$SANITISED_FILENAME/g" >> $tmp.2
done

mkdir "$RESOURCES_FOLDER/Derived/" > /dev/null 2>&1

# Create the source file from the template and our generated code
sed "/{%NIBDATA START%}/ r $tmp.1
1,/{%NIBDATA START%}/!{/{%NIBDATA END%}/,/{%NIBDATA START%}/! d;}
/{%NIBLOADERS START%}/ r $tmp.2
1,/{%NIBLOADERS START%}/!{/{%NIBLOADERS END%}/,/{%NIBLOADERS START%}/! d;}" "$RESOURCES_FOLDER/$SOURCE_NAME.m" > "$RESOURCES_FOLDER/Derived/$SOURCE_NAME.m"

# Copy the template header file in - $DERIVED_FILE_DIR
cp "$RESOURCES_FOLDER/$SOURCE_NAME.h" "$RESOURCES_FOLDER/Derived/$SOURCE_NAME.h"

rm "$tmp.1" "$tmp.2"

