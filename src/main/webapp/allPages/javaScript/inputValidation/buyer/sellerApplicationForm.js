const nicNo = document.getElementById("nicNo");

const form = document.getElementById("form");
const errorElement = document.getElementById("error");

form.addEventListener("submit", (e) => {
  let messages = [];

  const nicRegex = /^([0-9]{12}|[0-9]{9}(v|V|x|X))$/;

  if (!nicRegex.test(nicNo.value)) {
    messages.push("NIC number is not valid.");
  }

  if (messages.length > 0) {
    e.preventDefault();
    errorElement.innerText = messages.join("\n");
  }
});

document.getElementById("nicFront").addEventListener("change", validateFile);
document.getElementById("nicBack").addEventListener("change", validateFile);

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
