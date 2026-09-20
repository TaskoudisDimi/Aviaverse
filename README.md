--model claude-3-5-sonnet-20241022 

Λογαριασμοί / credentials που πρέπει να μεταφερθούν ή να ξαναδημιουργηθούν στο δικό του όνομα:

Cal.com — είτε του δίνεις πρόσβαση στον δικό σου λογαριασμό, είτε φτιάχνει δικό του και αλλάζει το VITE_CAL_USERNAME.
Gemini API key (GEMINI_API_KEY) — δικό του Google AI Studio key (θυμήσου το ανοιχτό ζήτημα με το ACCESS_TOKEN_TYPE_UNSUPPORTED).
Server access — SSH στο 188.245.64.189 (root), ή migration σε server δικό του.
.env.prod πάνω στον server — JWT_SECRET, POSTGRES_PASSWORD, GEMINI_API_KEY κ.λπ.
Domain / DNS αν θέλετε δικό σας domain αντί για IP.
Τεχνικά items:

Docs για το πώς τρέχει το deploy (build-prod.sh → deploy-prod.sh) — ήδη υπάρχουν σαν scripts.
Του δείχνεις πού είναι το docker-compose.prod.yml και τι κάνει κάθε service.
Πρόσβαση στη βάση (psql credentials) αν χρειαστεί να διαχειρίζεται περιεχόμενο απευθείας.