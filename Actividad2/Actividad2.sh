GITHUB_USER="brandonT2002"
URL=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# jq -r imprime solo el valor del json
USER_ID=$(echo "$URL" | jq -r '.id')
CREATED_AT=$(echo "$URL" | jq -r '.created_at')

MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta creada el: $CREATED_AT"
echo "$MESSAGE"

DATE=$(date +%F)
LOG_DIR="/tmp/$DATE"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/saludos.log"
echo "$MESSAGE" > "$LOG_FILE"
