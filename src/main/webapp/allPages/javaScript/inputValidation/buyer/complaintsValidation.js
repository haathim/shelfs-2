const complaintTitle = document.getElementById("complaintTitle");
const complaintDescription = document.getElementById("complaintDescription");

const form = document.getElementById("complaintForm");
const errorElement = document.getElementById("error");

form.addEventListener("submit", (e) => {
    let messages = [];

    const titleRegex = /^[\w\s\.,!&\?]{1,50}$/;
    const descriptionRegex = /^[\w\s\.,!&\?]{1,500}$/;


    if (!titleRegex.test(complaintTitle.value)) {
        messages.push("Complaint title is not valid.");
    }

    if (!descriptionRegex.test(complaintDescription.value)) {
        messages.push("Complaint description is not valid.");
    }

    if (messages.length > 0) {
        e.preventDefault();
        errorElement.innerText = messages.join("\n");
    }
});
