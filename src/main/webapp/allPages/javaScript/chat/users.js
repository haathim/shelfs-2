const searchBar = document.querySelector(".search input"),
searchIcon = document.querySelector(".search button"),
usersList = document.querySelector(".users-list");

// searchIcon.onclick = ()=>{
//   searchBar.classList.toggle("show");
//   searchIcon.classList.toggle("active");
//   searchBar.focus();
//   if(searchBar.classList.contains("active")){
//     searchBar.value = "";
//     searchBar.classList.remove("active");
//   }
// }

searchBar.onkeyup = ()=>{
  let searchTerm = searchBar.value;
  if(searchTerm != ""){
    searchBar.classList.add("active");
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "searchChatUsers", true);
    xhr.onload = ()=>{
      if(xhr.readyState === XMLHttpRequest.DONE){
        if(xhr.status === 200){
          let data = xhr.response;
          usersList.innerHTML = data;
        }
      }
    }
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.send("searchTerm=" + searchTerm);
  }else{
    searchBar.classList.remove("active");
    loadUsers()
  }

}

const loadUsers = () => {
  let xhr = new XMLHttpRequest();
  xhr.open("GET", "chatUsers", true);
  xhr.onload = ()=>{
    if(xhr.readyState === XMLHttpRequest.DONE){
        if(xhr.status === 200){
          let data = xhr.response;
          if(!searchBar.classList.contains("active")){
            usersList.innerHTML = data;
          }
        }
    }
  }
  xhr.send();
};

setTimeout(loadUsers, 500)

