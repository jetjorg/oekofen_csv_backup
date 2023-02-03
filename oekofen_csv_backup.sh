#!/bin/bash

# Edit this
BOILER_IP='192.168.1.128' # Todo: Remove the example IP and set this to the IP of your boiler
DEST_PATH=''              # Path where the files will be backed up to. Leave empty to use the current directory.
DEST_DIRECTORY='logfiles' # Directory name where the files will be backed up to.

# --------------------------------------------------------------
# Do not touch what's below, unless you know what you are doing

BOILER_LOG_FILES_DIR='/logfiles/pelletronic/' # Todo: test if this is the same for all boilers models
BOILER_LOG_FILES_URL="http://$BOILER_IP$BOILER_LOG_FILES_DIR"

if [ -z "$BOILER_IP" ]; then
  echo "Error: Please edit the script and set the IP of your boiler."
  exit 1
fi

if [ -z "$DEST_DIRECTORY" ]; then
  echo "Error: Please edit the script and set a destination directory."
  exit 1
fi

if [ -z "$DEST_PATH" ]; then
  echo "Info: You did not set a destination path. Using the current directory."
  DEST_PATH="$(pwd)"
fi

LOGFILES_PATH="$DEST_PATH/$DEST_DIRECTORY"
echo "Info: Log files will be saved to $LOGFILES_PATH"
mkdir -p $LOGFILES_PATH && cd $LOGFILES_PATH

printf "%s\n" "Info: Downloading log files" "==> From $BOILER_LOG_FILES_URL" "<== To $LOGFILES_PATH"
wget --mirror -nd -A csv -R "titles.csv" -N -q $BOILER_LOG_FILES_URL >/dev/null && echo "Done."
