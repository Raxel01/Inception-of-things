FILE="go.mod"

if [ -f "$FILE" ]; then
    echo "$FILE exists..."
    go mod tidy

else
    go mod init github/Raxel01/inceptionapps
    go mod tidy
fi


./server