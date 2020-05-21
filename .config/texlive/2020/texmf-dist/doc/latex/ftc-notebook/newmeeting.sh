#!/bin/bash
# file name, entry num
if [ $# -ne 2 ];
    then echo "
  USAGE: newmeeting.sh name num
    create a new directory and tex file for your meeting, where
      name: file directory and file name for the new entry (e.g. sept06)
      num:  populate src/name/name.tex with num tasks"
  exit
fi

# customize your list of team members
MEMBERS="Alonso, Aman, Arjun, Cadence, David, Deeya, Divek, Elina, Kaitlyn, Nicky, Zachary"

DIR=src/$1
FILE=src/$1.tex

if [ -d "$DIR" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
    echo "directory $DIR exists already, pick a new name"
    exit
fi

mkdir $DIR

# print new day entry
echo "
\begin{Meeting}% [type]% optional type (Preseason, Competition)
  {}% title
  {}% date
  {hours}% duration
  {$MEMBERS}% members
  {% list of tasks" > $FILE

# print task within new day entry
for i in `seq 1 $2`;
do
  echo "     %
     \TaskInfo{}{task:$1:}% title & label
       {}% reflection" >> $FILE
done
echo "}

" >> $FILE

# print tasks
for i in `seq 1 $2`;
do
  echo "

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% task: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\Task% optional continuation of task, e.g. [\TaskRef{task:}]
  {}% {num}[num]: num in 1-6: 1 Strategy; 2 Design; 3 Build; 4 Math/Physic; 5 Software; 6 Team


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\Section{Purpose and Overview}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\Section{Design Process and Decisions}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\Section{Conclusions}

" >> $FILE
done

# print end of new day entry
echo "
 \end{Meeting}
" >> $FILE

echo "add following in main tex file:
    \input{src/$1.tex}
"





