
let min = 1;
let max = 100;
let random = Math.floor(Math.random() * (max - min)) + min;
let playerNumber = document.getElementById("input")
let response = document.getElementById('response')
let tryNumber = 0


console.log("le chiffre aleatoire est : " + random)
document.getElementById("input").addEventListener("keyup", function (e) {
    if (e.keyCode === 13 && playerNumber.value != "") {
        tryNumber++
        console.log(playerNumber.value)
        if (playerNumber.value == random) {
            response.innerHTML = 'vous avez gagne en ' + tryNumber + ' coups'
        } else if (playerNumber.value < random) {
            response.innerHTML = 'Le nombre est trop petit'
        } else if (playerNumber.value > random) {
            response.innerHTML = 'Le nombre est trop grand'
        }
        playerNumber.value = ''
        playerNumber.focus
    }
});



