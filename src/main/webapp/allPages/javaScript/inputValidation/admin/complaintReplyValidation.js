const replyDescription = document.getElementById("replyDescription");

const form = document.getElementById("complaintReplyForm");
const errorElement = document.getElementById("error");

form.addEventListener("submit", (e) => {
    let messages = [];

    const descriptionRegex = /^[\w\s\.,!&\?]{1,500}$/;

    if (!descriptionRegex.test(replyDescription.value)) {
        messages.push("Reply description is not valid.");
    }

    if (messages.length > 0) {
        e.preventDefault();
        errorElement.innerText = messages.join("\n");
    }
});
