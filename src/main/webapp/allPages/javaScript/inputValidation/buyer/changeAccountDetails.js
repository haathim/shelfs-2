const districts = [
    "Colombo",
    "Kandy",
    "Galle",
    "Ampara",
    "Anuradhapura",
    "Badulla",
    "Batticaloa",
    "Gampaha",
    "Hambantota",
    "Jaffna",
    "Kalutara",
    "Kegalle",
    "Kilinochchi",
    "Kurunegala",
    "Mannar",
    "Matale",
    "Matara",
    "Moneragala",
    "Mullativu",
    "Nuwara Eliya",
    "Polonnaruwa",
    "Puttalam",
    "Ratnapura",
    "Trincomalee",
    "Vavuniya",
];

const provinces = [
    "Central",
    "Northern",
    "North Central",
    "North Western",
    "Sabaragamuwa",
    "Southern",
    "Uva",
    "Western",
    "Eastern",
];

const distProv = [
    { district: "Colombo", province: "Western" },
    { district: "Kandy", province: "Central" },
    { district: "Galle", province: "Southern" },
    { district: "Ampara", province: "Eastern" },
    { district: "Anuradhapura", province: "North Central" },
    { district: "Badulla", province: "Uva" },
    { district: "Batticaloa", province: "Eastern" },
    { district: "Gampaha", province: "Western" },
    { district: "Hambantota", province: "Southern" },
    { district: "Jaffna", province: "Northern" },
    { district: "Kalutara", province: "Western" },
    { district: "Kegalle", province: "Sabaragamuwa" },
    { district: "Kilinochchi", province: "Northern" },
    { district: "Kurunegala", province: "North Western" },
    { district: "Mannar", province: "Northern" },
    { district: "Matale", province: "Central" },
    { district: "Matara", province: "Southern" },
    { district: "Moneragala", province: "Uva" },
    { district: "Mullativu", province: "Northern" },
    { district: "Nuwara Eliya", province: "Central" },
    { district: "Polonnaruwa", province: "North Central" },
    { district: "Puttalam", province: "North Western" },
    { district: "Ratnapura", province: "Sabaragamuwa" },
    { district: "Trincomalee", province: "Eastern" },
    { district: "Vavuniya", province: "Northern" },
];

const selectDis = document.getElementById("district");
const selectProv = document.getElementById("province");
selectProv.value = "Western";

distProv.forEach((location) => {
    const option = document.createElement("option");
    option.text = option.value = location.district;
    selectDis.add(option);
});

selectDis.addEventListener("change", (e) => {
    selectProv.value = distProv
        .filter((location) => location.district === selectDis.value)
        .map((location) => location.province)[0];
    // document.getElementById("instructions").value = selectProv.value
    console.log(selectProv.value);
    console.log("Changed");
});

// provinces.forEach((province) => {
//     const option = document.createElement("option");
//     option.text = option.value = province;
//     selectProv.add(option);
// });

const uname = document.getElementById("uname");
const pass = document.getElementById("pass");
const pass2 = document.getElementById("pass2");
const firstName = document.getElementById("firstName");
const lastName = document.getElementById("lastName");
const houseNo = document.getElementById("houseNo");
const street = document.getElementById("street");
const city = document.getElementById("city");
const mobileNo = document.getElementById("mobileNo");
const email = document.getElementById("email");

const formnew = document.getElementById("formnew");
const errorElementnew = document.getElementById("errornew");

formnew.addEventListener("submit", (e) => {
    let messages = [];

    //checking if username is available
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "../checkUsername?username=" + uname.value, false);
    xhr.send();
    if (xhr.response === "false") {
        messages.push("Username already exists. Please try another one.");
    }

    //checking if email is available
    const xhr1 = new XMLHttpRequest();
    xhr1.open("GET", "../checkEmail?email=" + email.value, false);
    xhr1.send();
    if (xhr1.response === "false") {
        messages.push("Email already used. Please try another one.");
    }

    //checking if all other inputs are valid
    const unameRegex = /^\w{3,20}$/;
    const nameRegex = /^[A-Z][a-z]{1,19}$/;
    const houseNoRegex = /^[a-zA-Z0-9]{1,10}$/;
    const street_cityRegex = /^[a-zA-Z\s]{1,30}$/;
    const mobileNoRegex =
        /^(?:0|94|\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|4|5|6|7|8)\d)\d{6}$/;
    const emailRegex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;

    if (uname.length < 3 || uname.length > 20) {
        messages.push("Username length is too long or too short");
    }

    if (!unameRegex.test(uname.value)) {
        messages.push("Username does not match requirements");
    }

    if (pass.value.length <= 8 || pass.value.length >= 20) {
        messages.push("Password length is too long or too short");
    }

    if (pass.value !== pass2.value) {
        messages.push("Passwords do not match");
    }

    if (!nameRegex.test(firstName.value)) {
        messages.push("First Name does not match requirements");
    }

    if (!nameRegex.test(lastName.value)) {
        messages.push("Last Name does not match requirements");
    }

    if (!houseNoRegex.test(houseNo.value)) {
        messages.push("House Number does not match requirements");
    }

    if (!street_cityRegex.test(street.value)) {
        messages.push("Street does not match requirements");
    }

    if (!street_cityRegex.test(city.value)) {
        messages.push("City does not match requirements");
    }

    if (!mobileNoRegex.test(mobileNo.value)) {
        messages.push("Mobile Number does not match requirements");
    }

    if (!emailRegex.test(email.value)) {
        messages.push("Email does not match requirements");
    }

    if (messages.length > 0) {
        console.log("Errors are " + messages.length);
        e.preventDefault();
        errorElementnew.innerText = messages.join("\n");
    }
});

// function checkUsername(username){
//
//     const xhr = new XMLHttpRequest()
//     xhr.open(
//         "GET",
//         "../checkUsername?username="+username,
//         false
//     )
//     xhr.send()
//
// }
