/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener("DOMContentLoaded", function () {
  var allPost = document.getElementById("all-post"); //lấy id nút Bài viết
  var userAllPost = document.querySelector(".user-all-post");

  var allPicture = document.getElementById("all-picture"); //lấy id nút Tất cả ảnh
  var userAllPicture = document.querySelector(".user-all-picture");

  if (allPicture && userAllPicture && userAllPost && userAllPost) {
    allPicture.addEventListener("click", function () {
      userAllPicture.style.display = "flex";
      userAllPost.style.display = "none";
    });

    allPost.addEventListener("click", function () {
      userAllPost.style.display = "block";
      userAllPicture.style.display = "none";
    });
  } else {
    console.error("One or more elements not found in the DOM.");
  }
});

function selectListItem(element) {
  // Lấy tất cả các phần tử <li>
  var listItems = document.querySelectorAll(".profile-mid li");

  // Xóa class 'selected' từ tất cả các phần tử
  listItems.forEach(function (li) {
    li.classList.remove("selected");
  });

  // Thêm class 'selected' cho phần tử được chọn
  element.classList.add("selected");
}

var userSettings = document.querySelector(".user-settings");
var darkBtn = document.getElementById("dark-button");
var LoadMoreBackground = document.querySelector(".btn-LoadMore");
var friendRequests = document.querySelector(".friend-requests");
var wrapFriend = document.querySelector(".wrap-friend");
function showFriend() {
  wrapFriend.style.display = "block";
}

function closeFriend() {
  wrapFriend.style.display = "none";
}
function UserSettingToggle() {
  userSettings.classList.toggle("user-setting-showup-toggle");
}
// darkBtn.onclick = function(){
//     darkBtn.classList.toggle("dark-mode-on");
// }

function darkModeON() {
  darkBtn.classList.toggle("dark-mode-on");
  document.body.classList.toggle("dark-theme");
}
function LoadMoreToggle() {
  LoadMoreBackground.classList.toggle("loadMoreToggle");
}
//function FriendRequestToggle(){
//
//    friendRequest.classList.toggle("friend-request-showup-toggle");
//
//};
function FriendRequestToggle() {
  friendRequests.classList.toggle("friend-request-showup-toggle");
}
function toggleProfileEditing(state) {
  var div = document.getElementById("profile-editing");
  var editButton = document.getElementById("editButton");

  if (state) {
    editButton.disabled = true;
    div.style.display = "block";
  } else {
    editButton.disabled = false;
    div.style.display = "none";
  }
}
function previewAvatar() {
  const file = document.getElementById("avatarInput").files[0];
  if (file) {
    document.getElementById("avatarPreview").src = URL.createObjectURL(file);
  }
}
