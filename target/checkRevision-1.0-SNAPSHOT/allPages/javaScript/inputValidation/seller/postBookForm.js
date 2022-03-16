const categories = ["Fiction", "Non-Fiction", "Other"];

const selectCategory = document.getElementById("category");

categories.forEach((category) => {
  const option = document.createElement("option");
  option.text = option.value = category;
  selectCategory.add(option);
});

const languages = ["English", "Sinhala", "Tamil", "Other"];

const selectLanguage = document.getElementById("language");

languages.forEach((language) => {
  const option = document.createElement("option");
  option.text = option.value = language;
  selectLanguage.add(option);
});

const title = document.getElementById("title");
const author = document.getElementById("author");
const isbn = document.getElementById("isbn");
const price = document.getElementById("price");
const description = document.getElementById("description");
const frontPhoto = document.getElementById("frontPhoto");
const backPhoto = document.getElementById("backPhoto");

const form = document.getElementById("form");
const errorElement = document.getElementById("error");

form.addEventListener("submit", (e) => {
  let messages = [];

  const titleRegex = /^[\w\s\.,!&\?]{1,50}$/;
  const authorRegex = /^([a-zA-Z]|\s|\.){3,50}$/;
  const descriptionRegex = /^[\w\s\.,!&\?]{1,500}$/;
  const isbnRegex = /^\d{13}$/;

  if (!titleRegex.test(title.value)) {
    messages.push("Title name is not valid.");
  }

  if (!authorRegex.test(author.value)) {
    messages.push("Author is not valid.");
  }

  if (!descriptionRegex.test(description.value)) {
    messages.push("Description is not valid.");
  }

  if (!isbnRegex.test(isbn.value)) {
    messages.push("ISBN number is not valid.");
  }

  if (messages.length > 0) {
    e.preventDefault();
    errorElement.innerText = messages.join("\n");
  }
});

frontPhoto.addEventListener("change", validateFile);
backPhoto.addEventListener("change", validateFile);

function validateFile() {
  const allowedExtensions = ["jpg", "png"],
    sizeLimit = 2_000_000; // 2 megabyte

  // destructuring file name and size from file object
  const { name: fileName, size: fileSize } = this.files[0];

  /*
   * if filename is apple.png, we split the string to get ["apple","png"]
   * then apply the pop() method to return the file extension
   *
   */
  const fileExtension = fileName.split(".").pop();

  /*
      check if the extension of the uploaded file is included
      in our array of allowed file extensions
    */
  let messages = [];
  if (!allowedExtensions.includes(fileExtension)) {
    messages.push("File type not allowed");
    this.value = null;
  } else if (fileSize > sizeLimit) {
    messages.push("File size too large");
    this.value = null;
  }

  if (messages.length > 0) {
    errorElement.innerText = messages.join("\n");
  }
}
