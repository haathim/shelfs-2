
const currentPassword = document.getElementById('pass')
const form = document.getElementById('login')
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

    if (messages.length > 0) {
        console.log("Errors are " + messages.length)
        e.preventDefault()
        errorElement.innerText = messages.join('\n')
    }

})