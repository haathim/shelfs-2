const categories = ["Fiction", "Non-Fiction", "Other"];

const selectCategory = document.getElementById("category");

categories.forEach((category) => {
  const option = document.createElement("option");
  option.text = option.value = category;
  selectCategory.add(option);
});

const title = document.getElementById("title");
const author = document.getElementById("author");
// const category = document.getElementById('category')
const preferredPrice = document.getElementById("preferredPrice");
const comment = document.getElementById("comment");

const form = document.getElementById("form");
const errorElement = document.getElementById("error");

form.addEventListener("submit", (e) => {
  let messages = [];

  const titleRegex = /^[\w\s\.,!&\?]{1,50}$/;
  const authorRegex = /^([a-zA-Z]|\s|\.){3,50}$/;
  const commentRegex = /^[\w\s\.,!&\?]{1,500}$/;

  if (!titleRegex.test(title.value)) {
    messages.push("Title does not match requirements");
  }

  if (!authorRegex.test(author.value)) {
    messages.push("Author name does not match requirements");
  }

  if (!commentRegex.test(comment.value)) {
    messages.push("Comment does not match requirements");
  }

  if (preferredPrice.value < 0 || preferredPrice.value > 10000) {
    messages.push("Preferred price is not within range");
  }

  if (messages.length > 0) {
    e.preventDefault();
    errorElement.innerText = messages.join("\n");
  }
});
