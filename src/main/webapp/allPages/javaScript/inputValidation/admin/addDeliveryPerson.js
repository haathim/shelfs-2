const username = document.getElementById("username");
const password = document.getElementById("password");
const password2 = document.getElementById("password2");
const firstName = document.getElementById("firstName");
const lastName = document.getElementById("lastName");
const mobileNo = document.getElementById("mobileNo");

const form = document.getElementById("form");
const errorElement = document.getElementById("error");

form.addEventListener("submit", (e) => {
  let messages = [];

  //checking if username is available
  const xhr = new XMLHttpRequest();
  xhr.open("GET", "../checkUsername?username=" + username.value, false);
  xhr.send();
  if (xhr.response === "false") {
    messages.push("Username already exists. Please try another one.");
  }

  const unameRegex = /^\w{3,20}$/;
  const nameRegex = /^[A-Z][a-z]{1,19}$/;
  const mobileNoRegex =
    /^(?:0|94|\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|4|5|6|7|8)\d)\d{6}$/;

  if (username.length < 3 || username.length > 20) {
    messages.push("Username length is too long or too short");
  }

  if (!unameRegex.test(username.value)) {
    messages.push("Username does not match requirements");
  }

  if (password.value.length <= 8 || password.value.length >= 20) {
    messages.push("Password length is too long or too short");
  }

  if (password.value !== password2.value) {
    messages.push("Passwords do not match");
  }

  if (!nameRegex.test(firstName.value)) {
    messages.push("First Name does not match requirements");
  }

  if (!nameRegex.test(lastName.value)) {
    messages.push("Last Name does not match requirements");
  }

  if (!mobileNoRegex.test(mobileNo.value)) {
    messages.push("Mobile Number does not match requirements");
  }

  if (messages.length > 0) {
    e.preventDefault();
    errorElement.innerText = messages.join("\n");
  }
});
