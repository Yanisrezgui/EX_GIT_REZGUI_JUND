bool=true
FILE_SCORE=Scores.txt
FILE_HIGHSCORE=HighScore.txt

if [ ! -f "$FILE_SCORE" ]; then
        touch Scores.txt
fi

if [ ! -f "$FILE_HIGHSCORE" ]; then
        touch HighScore.txt
        echo 999 > HighScore.txt
        highscore=$(<HighScore.txt)
else
        highscore=$(<HighScore.txt)
        echo le HighScore est de : $highscore
fi

while $bool; do

nbAlea=$((($RANDOM % 99) + 1))

let "b = 1"
let "h = 100"
let "coup = 1"

read -p "entrez votre nom : " name

read -p "Bonjour $name, veuillez entrer un nombre compris entre 1 et 100 : " nombre
while [ "$nombre" != "$nbAlea" ]; do
        if [ "$nombre" -lt "$nbAlea" ]; then
                let "b = $nombre"
                result="Trop petit"
        else
                let "h = $nombre"
                result="Trop grand"
        fi
        read -p "$result, entrez un nombre compris entre ${b} et ${h} : " nombre
        coup=$((coup+1))
done

        echo "Bravo, le nombre etait en effet $nbAlea et vous avez trouvé en $coup coup(s)"
        
        #sed -i "1i HighScore = 3" Scores.txt
        echo "$coup $name" >> Scores.txt
        sortHistory="$(sort -n Scores.txt)"
        >Scores.txt
        echo "$sortHistory" >> Scores.txt
                #cat Scores.tkt | sort -n | head -n 1

        
        read -p "Voulez-vous rejouer (o pour oui n pour non) : " rejouer
        if [ "$rejouer" = "o" ]; then
                bool=true
        else
                bool=false
                echo "Jeux terminé"
        fi

        if [ $coup -lt $highscore ]; then
                echo "$coup" > HighScore.txt
        fi
done