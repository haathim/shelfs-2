
const currentPassword = document.getElementById('currentPassword')
const newPassword = document.getElementById('newPassword')
const newPassword2 = document.getElementById('newPassword2')

const form = document.getElementById('form')
const errorElement = document.getElementById('error')

form.addEventListener('submit', (e) => {

    let messages = []

    //checking if username is available
    const xhr = new XMLHttpRequest()
    xhr.open(
        "POST",
        "checkUsernamePassword",
        false
    )
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    xhr.send("currentPassword=" + currentPassword.value)

    if (xhr.response === "false"){
        messages.push("Current password is not the correct one.")
    }

    if (newPassword.value.length <= 8 || newPassword.value.length >= 20) {
        messages.push('Password length is too long or too short')
    }

    if(newPassword.value !== newPassword2.value){
        messages.push('Passwords do not match')
    }

    if (messages.length > 0) {
        console.log("Errors are " + messages.length)
        e.preventDefault()
        errorElement.innerText = messages.join('\n')
    }

})
