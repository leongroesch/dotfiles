#!/bin/bash
add_class ()
{
	SOURCE=src/$1.cpp
	INCLUDE=include/$1.h
	#Check if files are already there
	if [ -e $SOURCE ] || [ -e $INCLUDE ]
	then
		echo "Already exists"
		exit
	fi
	#Check if Folders are existend
	if [ ! -e src ]
	then
		mkdir src
	fi
	if [ ! -e include ]
	then
		mkdir include
	fi

	touch $SOURCE $INCLUDE
	UPPER_CLASS=$(echo $1|tr '[:lower:]' '[:upper:]'_H_)
	echo "#ifndef _${UPPER_CLASS}_H_" >> $INCLUDE
	echo -e "#define _${UPPER_CLASS}_H_\n" >> $INCLUDE
	echo -e "class ${1} { \n\tprivate: \n\n\tpublic: \n};\n" >> $INCLUDE
	echo "#endif" >> $INCLUDE

	echo "#include \"${1}.h\"" >> $SOURCE

	sed -i "s/set(SOURCES/set(SOURCES src\/${1}.cpp/g" CMakeLists.txt
}

