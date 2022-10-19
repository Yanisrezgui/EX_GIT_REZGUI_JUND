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